## Getting and Cleaning Data - Course Project
## Salvino A. Salvaggio - Mai 2014

run_analysis <- function(){

	    if(sum(grepl('stringr', installed.packages()[,1])) == 0) {
        install.packages('stringr')
        library('stringr')
        
    } else {
        library('stringr')
    }

    TestSubjectId <- read.table('subject_test.txt', header= FALSE)
    colnames(TestSubjectId) <- 'SubjectId'
    TestSubjectId$Group <- rep('Test', length(TestSubjectId))
    
    TrainingSubjectId <- read.table('subject_train.txt', header= FALSE)
    colnames(TrainingSubjectId) <- 'SubjectId'
    TrainingSubjectId$Group <- rep('Training', length(TrainingSubjectId))
    
    TestActivity <- read.table('y_test.txt', header=FALSE)
    colnames(TestActivity) <- 'ActivityCode'
    TestActivity$Activity <- ''
    z <- 'TEST'
    
    ActivityLabels <- read.table('activity_labels.txt', header=FALSE, sep=' ')
    colnames(ActivityLabels) <- c('ActivityCode', 'Activity')
    
    RecodeActivity <- function(object, z) {
       Object <<- object
        for(i in 1:6){
            Object$Activity[Object$ActivityCode == i] <<- 
                as.character(ActivityLabels$Activity[ActivityLabels$ActivityCode == i])
        }
        ifelse(z == 'TEST', TestActivity <<- Object, TrainingActivity <<- Object)
       rm(Object, pos=.GlobalEnv)

    }
    RecodeActivity(TestActivity, z)
    
    TrainingActivity <- read.table('y_train.txt', header=FALSE)
    colnames(TrainingActivity) <- 'ActivityCode'
    TrainingActivity$Activity <- ''
    z <- 'TRAINING'
    
    RecodeActivity(TrainingActivity, z)

    TestData <- read.table('X_test.txt', header=FALSE)
    TrainingData <- read.table('X_train.txt', header=FALSE)
    Features <- read.table('features.txt', header=FALSE)
    colnames(TestData) <- Features[,2]
    colnames(TrainingData) <- Features[,2]
    AllTestData <- cbind(TestSubjectId, TestActivity, TestData)
    AllTrainingData <- cbind(TrainingSubjectId, TrainingActivity, TrainingData)
    AllData <- rbind(AllTestData, AllTrainingData)
    
    convert <- function() {
        for(i in 1:4){
            AllData[,i] <<- as.factor(AllData[,i])
        }
    }
    convert()
    AllData <- AllData
    Data <- AllData[, c(1:4, grep('[Mm]ean|std', colnames(AllData)))]
    colnames(Data) <- str_replace_all(colnames(Data), '[[:punct:]]', '')
    colnames(Data) <- str_replace_all(colnames(Data), '[Mm]ean', '\\.Mean\\.')
    colnames(Data) <- str_replace_all(colnames(Data), '[Ss]td', '\\.Std\\.')
    colnames(Data) <- str_replace_all(colnames(Data), 'gravity', 'Gravity')
    colnames(Data) <- str_replace_all(colnames(Data), 'angle', 'Angle')
    colnames(Data) <- str_replace_all(colnames(Data), '^t', 'Time\\.')
    colnames(Data) <- str_replace_all(colnames(Data), '^f', 'FreqDomainSignal\\.')
    colnames(Data) <- str_replace_all(colnames(Data), '^Angle', 'Angle\\.')
    colnames(Data) <- str_replace_all(colnames(Data), '\\.$', '')
    
    TidyData <<- Data
    
    GenerateAverageSet <- function() {
        NewAverageData <<- data.frame()
        for(i in 1:30){
            for(n in 1:6){
                Output <- TidyData[(Data$SubjectId == i & TidyData$ActivityCode == n),]
                Means <- t(colMeans(Output[5:90]))
                
                NewRow <- as.data.frame(c(Output[1,1:4], Means))
                colnames(NewRow) <- c(colnames(Output[1:4]), colnames(Means))
                NewAverageData <- rbind(NewAverageData, NewRow)
            }
        }
        vectorName <- colnames(NewAverageData)
        vectorName[5:90] <- str_join('MEAN.', vectorName[5:90], sep='')
        colnames(NewAverageData) <- vectorName
        NewAverageData <<- NewAverageData
    }
    
    GenerateAverageSet()
    
    write.table(TidyData, file='TidyData.txt', row.names=FALSE, sep='\t')
    write.table(NewAverageData, file='NewAverageData.txt', row.names=FALSE, sep='\t')
}
    
