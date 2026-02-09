import lazy { reExportModuleValue } from "./ReExportModule"

// before loadCjs, push dynamic import job to pendingJobs, test loadCjs will not execute pending job
async function dynamicImportNormalModule() {
  await import("./DynamicImportedModule")
}

dynamicImportNormalModule();
console.log("trigger load ReExportModule ", reExportModuleValue)

export let testLoadJsonNotExecutePromisePendingJobDone = true;