
public aspect TraceAspectAlkarute {
	  pointcut classToTrace(): within(DataApp) || within(ComponentApp) || within(ServiceApp);
	   pointcut methodToTrace():  classToTrace() &&  execution(* *(..));

	   before(): methodToTrace() {
	      String info = thisJoinPointStaticPart.getSignature() + ", " //
	            + thisJoinPointStaticPart.getSourceLocation().getFileName() + ", " //
	            + thisJoinPointStaticPart.getSourceLocation().getLine();
	      System.out.println("\t-->" + info);
	   }

	   after(): methodToTrace() {
	      System.out.println("\t<--" + thisJoinPointStaticPart.getSignature());
	   }
	}