import { LogMap } from "../../../utils/LogMap"

LogMap.logModuleLoad("testLoadSoInTaskPoolNotExecutePromisePendingJob", "ReExportModule.ets")

// Has circular dependency here, ReExportModule depend on LoadNativeModule, LoadNativeModule depend on ReExportModule
export * from "./LoadNativeModule"

export let reExportModuleValue = 1;