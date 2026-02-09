import { LogMap } from "../../../utils/LogMap"
import { add } from "libentrytaskpool.so"

LogMap.logModuleLoad("testLoadSoInTaskPoolNotExecutePromisePendingJob", "LoadNativeModule.ets")

export let loadJsonModuleValue = add(1, 2);