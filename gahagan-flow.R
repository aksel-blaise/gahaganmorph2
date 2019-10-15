#load DiagrammeR
devtools::install_github("rich-iannone/DiagrammeR")
library(DiagrammeR)

#diagram of flowchart for gahagan biface study
mermaid("graph LR

subgraph data collection
A((scan)) -->|preprocess| C(Rvcg)
end

subgraph processing
C --> D[u-remesh]
D --> E[decimation]
end

subgraph alignment and landmarking
E -->|exportOFF| F(auto3dgm)
F -->|alignedOFF| G(Rvcg)
G -->|exportPLY| H(digit3dland)
F --> |exportLM| I(geomorph)
H --> |exportLM| I
end
"
)
