nextflow.enable.dsl=2

include { test_python_1 } from './modules/test_python_1/module.nf'

workflow {
input1 = Channel.fromPath(params.test_python_1.accessions).splitCsv(sep: ';').map { row -> tuple(evaluate(row[0]), evaluate(row[1])) }
test_python_1(input1)
}
