name := "Introducation"

version := "1.0"

scalaVersion := "2.11.6"

resolvers ++= Seq("snapshots" at "http://oss.sonatype.org/content/repositories/snapshots","releases"
    at "http://oss.sonatype.org/content/repositories/releases")

libraryDependencies ++= Seq("org.specs2" %% "specs2" % "1.12.3" % "test")
    
    
    