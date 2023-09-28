/**
 * @id ww/switch-case-repro
 * @kind path-problem
 * @problem.severity info
 */

import java
import semmle.code.java.dataflow.DataFlow

module StringFlowConfig implements DataFlow::ConfigSig {
    predicate isSource(DataFlow::Node source) {
        source.asExpr() instanceof StringLiteral and
        source.getEnclosingCallable().hasName("main")
    }

    predicate isSink(DataFlow::Node sink) {
        sink.getEnclosingCallable().hasName("sayHi")
    }

    // predicate isAdditionalFlowStep(DataFlow::Node n1, DataFlow::Node n2) {
    //     n1.asParameter().getAnAccess() = n2.asExpr()
    // }
}

module StringFlow = DataFlow::Global<StringFlowConfig>;
import StringFlow::PathGraph

from StringFlow::PathNode source, StringFlow::PathNode sink
where StringFlow::flowPath(source, sink)
select sink.getNode(), source, sink, sink.getNode().getEnclosingCallable().getName()
