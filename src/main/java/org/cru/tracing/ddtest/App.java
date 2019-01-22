package org.cru.tracing.ddtest;

import java.util.concurrent.TimeUnit;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws InterruptedException {
        while (true) {
            System.out.println( "Hello World!" );
            TimeUnit.SECONDS.sleep(5);
        }
    }
}
