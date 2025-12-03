# Title: Mermaid Diagram Example
# Author: Damien Dotta
# Description: Example demonstrating Mermaid diagram support in quartify

## Introduction ####

# This example shows how to include Mermaid diagrams in your R scripts.
# Mermaid diagrams are converted to proper Quarto format.

## Simple Flowchart ####

#| mermaid
#| eval: true
flowchart TD
    A[Christmas] -->|Get money| B(Go shopping)
    B --> C{Let me think}
    C -->|One| D[Laptop]
    C -->|Two| E[iPhone]
    C -->|Three| F[fa:fa-car Car]

# This creates a simple decision flowchart.

## Process Diagram ####

#| mermaid
#| eval: true
flowchart LR
    A[Start] --> B{Is it?}
    B -->|Yes| C[OK]
    C --> D[Rethink]
    D --> B
    B ---->|No| E[End]

# A more complex process flow with loops.

## Sequence Diagram ####

#| mermaid
#| eval: true
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
    Alice-)John: See you later!

# Sequence diagrams show interactions between entities.

## Class Diagram ####

#| mermaid
#| eval: true
classDiagram
    Animal <|-- Duck
    Animal <|-- Fish
    Animal <|-- Zebra
    Animal : +int age
    Animal : +String gender
    Animal: +isMammal()
    Animal: +mate()
    class Duck{
        +String beakColor
        +swim()
        +quack()
    }

# Class diagrams are useful for object-oriented design documentation.

## Regular R Code ####

# You can still include regular R code alongside Mermaid diagrams.

x <- 1:10
y <- x^2
plot(x, y, type = "l", main = "Simple Plot")

# The end!
