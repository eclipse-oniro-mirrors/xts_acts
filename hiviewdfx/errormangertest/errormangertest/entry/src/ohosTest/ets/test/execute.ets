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