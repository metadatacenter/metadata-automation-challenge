#!/usr/bin/env cwl-runner
#
# Example score submission file
#
cwlVersion: v1.0
class: CommandLineTool
baseCommand: python

hints:
  DockerRequirement:
    dockerPull: docker.synapse.org/syn18065892/scoring_harness

inputs:
  - id: inputfile
    type: File
  - id: goldstandard
    type: File

arguments:
  - valueFrom: run_scoring.R
  - valueFrom: $(inputs.inputfile.path)
  - valueFrom: $(inputs.goldstandard.path)
  - valueFrom: results.json

requirements:
  - class: InlineJavascriptRequirement
     
outputs:
  - id: results
    type: File
    outputBinding:
      glob: results.json