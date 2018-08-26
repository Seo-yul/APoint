package cf.yul.apoint.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MVCException {

	@ExceptionHandler(Exception.class)
	public String exceptionHandler() {
		return "error";
	}
	
}
