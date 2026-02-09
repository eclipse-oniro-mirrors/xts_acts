import { errorManager } from "@kit.AbilityKit";
import { BusinessError } from "@kit.BasicServicesKit";

@Concurrent
export function execute1(){
  throw Error("throw error")
}
@Concurrent
export function execute2(param:string){
  return param
}
@Concurrent
export function execute3(){
  console.log("zcq excute3")
  throw Error("throw error task16")
}

@Concurrent
export  function  TaskPoolTest1() : number {
  console.info('testErrorManger_1900 taskpool start 1 ');
  let observer01: errorManager.ErrorHandler;
  const handler1: errorManager.ErrorHandler = (reason: Error) => {
    if (observer01) {
      observer01(reason);
    }
    console.info('testErrorManger_1900  First uncaught exception handler invoked.');
  };
  let code = 0
  try {
    console.info('testErrorManger_1900 taskpool start 2 ');
    observer01 = errorManager.setDefaultErrorHandler(handler1);
    console.info('testErrorManger_1900 taskpool start 3 ');
  }catch (e){
    console.error(`TestTag error code: ${(e as BusinessError).code}, error msg: ${(e as BusinessError).message}`);
    console.info('testErrorManger_1900 ' + e.code);
    code = e.code
  }
  if (code == 16000205){
    throw Error(code.toString())
  }
  return 0
}