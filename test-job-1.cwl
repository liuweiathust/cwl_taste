#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: ScatterFeatureRequirement

inputs: 
    ms: string[]
outputs:
    resultfile:
        type: File
        outputSource: step2/merge_file

steps:
    step1:
        run:
            class: CommandLineTool
            baseCommand: [python, /home/liuwei/Workspaces/CWL/test.py]
            inputs:
                message:
                    type: string
                    inputBinding: 
                        position: 1
                        prefix: --message
            outputs:
                message_file:
                    type: File
                    outputBinding:
                        glob: $(inputs.message)
        in:
            message: ms
        out: [message_file]
        scatter: [message]
    step2:
        run:
            class: CommandLineTool
            baseCommand: [python, /home/liuwei/Workspaces/CWL/merge.py]
            inputs:
                files:
                    type:
                        type: array
                        items: File
                    inputBinding:
                        position: 1
            outputs:
                merge_file:
                    type: File
                    outputBinding:
                        glob: merge.txt
        in:
            files: step1/message_file
        out: [merge_file]
