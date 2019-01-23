package org.cru.tracing.ddtest;

import datadog.trace.api.Trace;
import io.opentracing.Scope;
import io.opentracing.Tracer;
import io.opentracing.util.GlobalTracer;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * Hello world!
 *
 */
public class App 
{
    static Tracer tracer = GlobalTracer.get();
    static Random random = new Random();

    static int count = 0;
    public static void main( String[] args ) throws InterruptedException {
        while (true) {

            try (Scope scope = tracer.buildSpan("loop").startActive(true)) {
                scope.span().setTag("count", count);
                print();
                sleepShort();
            }
            sleepLong();
            count++;
        }
    }

//    @Trace
    private static void sleepLong() throws InterruptedException {
        TimeUnit.SECONDS.sleep(5);
    }

    @Trace
    private static void sleepShort() throws InterruptedException {
        TimeUnit.MICROSECONDS.sleep(random.nextInt(1000));
    }

    @Trace
    private static void print() {
        try (Scope scope = tracer.buildSpan("printing").startActive(true)) {
            System.out.println( "Hello World!" );
        }
    }
}
