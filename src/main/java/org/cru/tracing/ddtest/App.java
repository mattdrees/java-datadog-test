package org.cru.tracing.ddtest;

import io.opentracing.Scope;
import io.opentracing.Tracer;
import io.opentracing.util.GlobalTracer;
import java.util.concurrent.TimeUnit;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws InterruptedException {
        int count = 0;
        while (true) {
            Tracer tracer = GlobalTracer.get();

            try (Scope scope = tracer.buildSpan("printing").startActive(true)) {
                scope.span().setTag("count", count);

                System.out.println( "Hello World!" );
            }
            try (Scope scope = tracer.buildSpan("sleeping").startActive(true)) {
                scope.span().setTag("count", count);

                TimeUnit.SECONDS.sleep(5);
            }
        }
    }
}
