# GetMyShowiOS - iOS Coding Demo

## Dev environment
* Xcode 13.1
* Deployement Target iOS 13.0
* Cocoapoads - Used AlamofireImage for lazy loading of images

## Functional details:
* Fetches shows information with matching keyword
* Example use M and shows containing letter M appear


## Design Considerations:
* Used MVVM-C design pattern. Coordinator manages dependencies and navigation flow. However, considering the nature of project Coordinators were not 'enforced', but can be easily extended & scaled when more complex navigation is planned.
* Have kept minimum possible code in VCs and kept business logic & data source separated from VCs.
* Logical and reasonable usage of main Swift features like Extensions, Optionals, Extensions, Structs and Generics. 
* Followed 5 design principles:
    * S.O.L.I.D.
    * T.D.D.
    * D.I.
    * Clean architecture
    * DRY (Don't repeat yourself)
    * POLA (Principle of least astonishment)
* Minimum to no use of forced unwrapping.
* Have written a modular layer for network interactions. 
* Taken care of coding standards and conventions.
* Have considered cyclomatic complexity.
* Length of methods and file are as per standards.
* Have used structs and planned sub structs for storing constant values for better readability. This also helps avoid manual mistakes.

## Current limitations
* Basic UI - have not focussed much on enhancing the UI OR on adding more features.
* Had planned for caching the images and used those again when needed. 
* Has a few UT cases - Code coverage can be improved and more UI tests could have been written (Will be added soon).