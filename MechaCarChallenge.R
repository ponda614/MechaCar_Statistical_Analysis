library(dplyr)

mechaCar_data <- read.csv("MechaCar_mpg.csv",stringsAsFactors = F,check.names = F)

mechaCar_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar_data)

summary(mechaCar_lm)

suspensionCoil_data <- read.csv("Suspension_Coil.csv", check.names = F)

total_summary <- suspensionCoil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

lot_summary <- suspensionCoil_data %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

t.test(suspensionCoil_data$PSI,mu = 1500)

t.test(subset(suspensionCoil_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

t.test(subset(suspensionCoil_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

t.test(subset(suspensionCoil_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)
