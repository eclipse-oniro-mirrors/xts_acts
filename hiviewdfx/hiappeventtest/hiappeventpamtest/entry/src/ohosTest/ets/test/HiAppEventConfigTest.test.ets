import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';


export default function HiAppEventConfigTest() {
  describe('HiAppEventConfigTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    // ==================== setEventConfig 1.1接口 ====================

    // setEventConfig 1.1接口 执行成功的场景
    const config_true: Record<string, Record<string, hiAppEvent.ParamType>>[] = [
      // MAIN_THREAD_JANK 成功场景 - 单参数
      {"MAIN_THREAD_JANK": {"log_type": "0"}},
      {"MAIN_THREAD_JANK": {"log_type": "2"}},
      // MAIN_THREAD_JANK 成功场景 - 五参数组合
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": "100", "ignore_startup_time": "11", "sample_count": "10", "report_times_per_app": "3"}},

      // APP_CRASH 成功场景 - 单参数
      {"APP_CRASH": {"log_file_cutoff_sz_bytes": 0}},
      {"APP_CRASH": {"log_file_cutoff_sz_bytes": 1024}},
      {"APP_CRASH": {"log_file_cutoff_sz_bytes": 5242880}},
      {"APP_CRASH": {"extend_pc_lr_printing": true}},
      {"APP_CRASH": {"extend_pc_lr_printing": false}},
      {"APP_CRASH": {"simplify_vma_printing": true}},
      {"APP_CRASH": {"simplify_vma_printing": false}},

      // APP_CRASH 成功场景 - 两参数组合
      {"APP_CRASH": {"extend_pc_lr_printing": true, "simplify_vma_printing": true}},
      {"APP_CRASH": {"extend_pc_lr_printing": true, "log_file_cutoff_sz_bytes": 1024}},
      {"APP_CRASH": {"simplify_vma_printing": true, "log_file_cutoff_sz_bytes": 1024}},
      {"APP_CRASH": {"simplify_vma_printing": true, "log_file_cutoff_sz_bytes": -1}},
      {"APP_CRASH": {"extend_pc_lr_printing": true, "log_file_cutoff_sz_bytes": -1}},

      // APP_CRASH 成功场景 - 三参数组合
      {"APP_CRASH": {"extend_pc_lr_printing": true, "simplify_vma_printing": true, "log_file_cutoff_sz_bytes": 1024}},
      {"APP_CRASH": {"extend_pc_lr_printing": true, "simplify_vma_printing": true, "log_file_cutoff_sz_bytes": -1}},

      // RESOURCE_OVERLIMIT 成功场景 - 单参数
      {"RESOURCE_OVERLIMIT": {"js_heap_logtype": "event"}},
      {"RESOURCE_OVERLIMIT": {"js_heap_logtype": "event_rawheap"}},
      {"RESOURCE_OVERLIMIT": {"js_heap_logtype": "event", "invalid": "0"}}
    ];

    // setEventConfig 1.1接口 执行失败的场景（返回401）
    const config_401: Record<string, Record<string, hiAppEvent.ParamType>>[] = [
      // MAIN_THREAD_JANK 失败场景 - 缺少必需参数
      {"MAIN_THREAD_JANK": {}},
      {"MAIN_THREAD_JANK": {"invalid": "0"}},
      {"MAIN_THREAD_JANK": {"invalid": "0", "log_type": "0"}},
      {"MAIN_THREAD_JANK": {"sample_interval": 100}},
      {"MAIN_THREAD_JANK": {"ignore_startup_time": 11}},
      {"MAIN_THREAD_JANK": {"sample_count": 21}},
      {"MAIN_THREAD_JANK": {"report_times_per_app": 3}},

      // MAIN_THREAD_JANK 失败场景 - 参数类型错误
      {"MAIN_THREAD_JANK": {"log_type": 0}},
      {"MAIN_THREAD_JANK": {"log_type": -1}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": 100}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "ignore_startup_time": 11}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_count": 21}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "report_times_per_app": 3}},

      {"MAIN_THREAD_JANK": {"sample_interval": "100"}},
      {"MAIN_THREAD_JANK": {"ignore_startup_time": "11"}},
      {"MAIN_THREAD_JANK": {"sample_count": "21"}},
      {"MAIN_THREAD_JANK": {"report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"log_type": "1"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": "100"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "ignore_startup_time": "11"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_count": "10"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"sample_interval": "100", "ignore_startup_time": "11"}},
      {"MAIN_THREAD_JANK": {"sample_interval": "100", "sample_count": "21"}},
      {"MAIN_THREAD_JANK": {"sample_interval": "100", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"ignore_startup_time": "11", "sample_count": "10"}},
      {"MAIN_THREAD_JANK": {"ignore_startup_time": "11", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"sample_count": "21", "report_times_per_app": "3"}},
      // MAIN_THREAD_JANK 成功场景 - 三参数组合
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": "100", "ignore_startup_time": "11"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": "100", "sample_count": "10"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": "100", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "ignore_startup_time": "11", "sample_count": "10"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "ignore_startup_time": "11", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_count": "10", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"sample_interval": "100", "ignore_startup_time": "11", "sample_count": "21"}},
      {"MAIN_THREAD_JANK": {"sample_interval": "100", "ignore_startup_time": "11", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"sample_interval": "100", "sample_count": "21", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"ignore_startup_time": "11", "sample_count": "21", "report_times_per_app": "3"}},
      // MAIN_THREAD_JANK 成功场景 - 四参数组合
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": "100", "ignore_startup_time": "11", "sample_count": "10"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": "100", "ignore_startup_time": "11", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "sample_interval": "100", "sample_count": "10", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"log_type": "1", "ignore_startup_time": "11", "sample_count": "10", "report_times_per_app": "3"}},
      {"MAIN_THREAD_JANK": {"sample_interval": "100", "ignore_startup_time": "11", "sample_count": "21", "report_times_per_app": "3"}},

      // MAIN_THREAD_JANK 失败场景 - 多参数类型错误
      {"MAIN_THREAD_JANK": {"log_type": 1, "sample_interval": "100", "ignore_startup_time": "11", "sample_count": "21", "report_times_per_app": "3"}},

      // APP_CRASH 失败场景 - 缺少必需参数
      {"APP_CRASH": {}},

      {"APP_CRASH": {"invalid": 0}},
      {"APP_CRASH": {"extend_pc_lr_printing": "true"}},
      {"APP_CRASH": {"log_file_cutoff_sz_bytes": "102400"}},
      {"APP_CRASH": {"simplify_vma_printing": "true"}},
      {"APP_CRASH": {"log_file_cutoff_sz_bytes": -1}},
      {"APP_CRASH": {"log_file_cutoff_sz_bytes": 5242881}},
      {"APP_CRASH": {"extend_pc_lr_printing": "true", "log_file_cutoff_sz_bytes": "102400", "simplify_vma_printing": "true"}},

      // APP_CRASH 失败场景 - 参数类型错误
      {"APP_CRASH": {"extend_pc_lr_printing": "true", "log_file_cutoff_sz_bytes": "102400", "simplify_vma_printing": "true"}},

      // RESOURCE_OVERLIMIT 失败场景 - 缺少必需参数
      {"RESOURCE_OVERLIMIT": {}},
      {"RESOURCE_OVERLIMIT": {"js_heap_logtype": "invalid"}},
      {"RESOURCE_OVERLIMIT": {"js_heap_logtype": "event", "invalid": 0}},
      {"RESOURCE_OVERLIMIT": {"js_heap_logtype": 0}},
      {"RESOURCE_OVERLIMIT": {"invalid": 0}},
      {"RESOURCE_OVERLIMIT": {"invalid": "0"}},
    ];

    // ==================== configEventPolicy 1.1接口 ====================

    // configEventPolicy 1.1接口 执行成功的场景
    const policies_true: hiAppEvent.EventPolicy[] = [
      // 空对象
      {},

      // mainThreadJankPolicy 成功场景 - 空对象
      {mainThreadJankPolicy: {}},

      // mainThreadJankPolicy 成功场景 - undefied
      {mainThreadJankPolicy: undefined},

      // mainThreadJankPolicy 成功场景 - 单参数
      {mainThreadJankPolicy: {logType: 0}},
      {mainThreadJankPolicy: {logType: 1}},
      {mainThreadJankPolicy: {logType: 2}},
      {mainThreadJankPolicy: {sampleInterval: 100}},
      {mainThreadJankPolicy: {sampleInterval: 50}},
      {mainThreadJankPolicy: {sampleInterval: 500}},
      {mainThreadJankPolicy: {sampleInterval: -1}},
      {mainThreadJankPolicy: {ignoreStartupTime: 11}},
      {mainThreadJankPolicy: {ignoreStartupTime: 3}},
      {mainThreadJankPolicy: {ignoreStartupTime: 2}},
      {mainThreadJankPolicy: {sampleCount: 21}},
      {mainThreadJankPolicy: {reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {reportTimesPerApp: 1}},
      {mainThreadJankPolicy: {reportTimesPerApp: -1}},
      {mainThreadJankPolicy: {autoStopSampling: true}},
      {mainThreadJankPolicy: {autoStopSampling: false}},

      // mainThreadJankPolicy 成功场景 - 两参数组合
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100}},
      {mainThreadJankPolicy: {logType: 1, ignoreStartupTime: 11}},
      {mainThreadJankPolicy: {logType: 1, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {logType: 1, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleInterval: 100, ignoreStartupTime: 11}},
      {mainThreadJankPolicy: {sampleInterval: 100, sampleCount: 21}},
      {mainThreadJankPolicy: {sampleInterval: 100, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {sampleInterval: 100, autoStopSampling: false}},
      {mainThreadJankPolicy: {ignoreStartupTime: 11, sampleCount: 21}},
      {mainThreadJankPolicy: {ignoreStartupTime: 11, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {ignoreStartupTime: 11, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleCount: 21, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {sampleCount: 21, autoStopSampling: false}},
      {mainThreadJankPolicy: {reportTimesPerApp: 3, autoStopSampling: false}},

      // mainThreadJankPolicy 成功场景 - 三参数组合
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, sampleCount: 21}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, ignoreStartupTime: 11, sampleCount: 11}},
      {mainThreadJankPolicy: {logType: 1, ignoreStartupTime: 11, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {logType: 1, ignoreStartupTime: 11, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, sampleCount: 10, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {logType: 1, sampleCount: 10, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21}},
      {mainThreadJankPolicy: {sampleInterval: 100, ignoreStartupTime: 11, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {sampleInterval: 100, ignoreStartupTime: 11, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleInterval: 100, sampleCount: 21, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {sampleInterval: 100, sampleCount: 21, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleInterval: 100, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {ignoreStartupTime: 11, sampleCount: 21, autoStopSampling: false}},
      {mainThreadJankPolicy: {ignoreStartupTime: 11, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: false}},

      // mainThreadJankPolicy 成功场景 - 四参数组合
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, sampleCount: 21, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, sampleCount: 21, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, ignoreStartupTime: 11, sampleCount: 10, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {logType: 1, ignoreStartupTime: 11, sampleCount: 10, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, ignoreStartupTime: 11, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, sampleCount: 10, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleInterval: 100, ignoreStartupTime: 11, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleInterval: 100, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {ignoreStartupTime: 11, sampleCount: 10, reportTimesPerApp: 3, autoStopSampling: false}},

      // mainThreadJankPolicy 成功场景 - 五参数组合
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {logType: 1, ignoreStartupTime: 11, sampleCount: 10, reportTimesPerApp: 3, autoStopSampling: false}},
      {mainThreadJankPolicy: {sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 10, reportTimesPerApp: 3, autoStopSampling: false}},

      // mainThreadJankPolicy 成功场景 - 六参数组合
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: false}},

      // cpuUsageHighPolicy 成功场景 - 空对象
      {cpuUsageHighPolicy: {}},

      // cpuUsageHighPolicy 成功场景 - undefied
      {cpuUsageHighPolicy: undefined},

      // cpuUsageHighPolicy 成功场景 - 单参数
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: -11}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: 22}},
      {cpuUsageHighPolicy: {threadLoadThreshold: 33}},
      {cpuUsageHighPolicy: {perfLogCaptureCount: 44}},
      {cpuUsageHighPolicy: {threadLoadInterval: 55}},

      // cpuUsageHighPolicy 成功场景 - 两参数组合
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, threadLoadThreshold: 33}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, perfLogCaptureCount: 44}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: 22, threadLoadThreshold: 33}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: 22, perfLogCaptureCount: 44}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: 22, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {threadLoadThreshold: 33, perfLogCaptureCount: 44}},
      {cpuUsageHighPolicy: {threadLoadThreshold: 33, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {perfLogCaptureCount: 44, threadLoadInterval: 55}},

      // cpuUsageHighPolicy 成功场景 - 三参数组合
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadThreshold: 33}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, perfLogCaptureCount: 44}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, threadLoadThreshold: 33, perfLogCaptureCount: 44}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, threadLoadThreshold: 33, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, perfLogCaptureCount: 44, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: 22, threadLoadThreshold: 33, perfLogCaptureCount: 44}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: 22, threadLoadThreshold: 33, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: 22, perfLogCaptureCount: 44, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {threadLoadThreshold: 33, perfLogCaptureCount: 44, threadLoadInterval: 55}},

      // cpuUsageHighPolicy 成功场景 - 四参数组合
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadThreshold: 33, perfLogCaptureCount: 44}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadThreshold: 33, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, perfLogCaptureCount: 44, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, threadLoadThreshold: 33, perfLogCaptureCount: 44, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: 22, threadLoadThreshold: 33, perfLogCaptureCount: 44, threadLoadInterval: 55}},

      // cpuUsageHighPolicy 成功场景 - 五参数组合
      {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadThreshold: 33, perfLogCaptureCount: 44, threadLoadInterval: 55}},

      // appCrashPolicy 成功场景 - 空对象
      {appCrashPolicy: {}},
      // cpuUsageHighPolicy 成功场景 - undefied
      {appCrashPolicy: undefined},

      // appCrashPolicy 成功场景 - 单参数
      {appCrashPolicy: {pageSwitchLogEnable: true}},
      {appCrashPolicy: {pageSwitchLogEnable: false}},
      {appCrashPolicy: {extendPcLrPrinting: true}},
      {appCrashPolicy: {extendPcLrPrinting: false}},
      {appCrashPolicy: {simplifyVmaPrinting: true}},
      {appCrashPolicy: {simplifyVmaPrinting: false}},
      {appCrashPolicy: {logFileCutoffSzBytes: 0}},
      {appCrashPolicy: {logFileCutoffSzBytes: 1024}},
      {appCrashPolicy: {logFileCutoffSzBytes: 5242880}},

      // appCrashPolicy 成功场景 - 两参数组合
      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: true, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, simplifyVmaPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: true, logFileCutoffSzBytes: 0}},
      {appCrashPolicy: {pageSwitchLogEnable: false, logFileCutoffSzBytes: 5242880}},
      {appCrashPolicy: {extendPcLrPrinting: true, logFileCutoffSzBytes: 5242880}},
      {appCrashPolicy: {extendPcLrPrinting: false, logFileCutoffSzBytes: 0}},
      {appCrashPolicy: {extendPcLrPrinting: true, simplifyVmaPrinting: false}},
      {appCrashPolicy: {extendPcLrPrinting: false, simplifyVmaPrinting: true}},
      {appCrashPolicy: {simplifyVmaPrinting: true, logFileCutoffSzBytes: 5242880}},
      {appCrashPolicy: {simplifyVmaPrinting: false, logFileCutoffSzBytes: 0}},

      // appCrashPolicy 成功场景 - 三参数组合
      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, simplifyVmaPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, logFileCutoffSzBytes: 1024}},
      {appCrashPolicy: {pageSwitchLogEnable: true, simplifyVmaPrinting: true, logFileCutoffSzBytes: 1024}},
      {appCrashPolicy: {extendPcLrPrinting: true, simplifyVmaPrinting: true, logFileCutoffSzBytes: 1024}},

      // appCrashPolicy 成功场景 - 四参数组合
      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: false, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: false, logFileCutoffSzBytes: 0, simplifyVmaPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: true, logFileCutoffSzBytes: 5242880, simplifyVmaPrinting: false}},

      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: false, logFileCutoffSzBytes: -1}},
      {appCrashPolicy: {simplifyVmaPrinting: true, extendPcLrPrinting: false, logFileCutoffSzBytes: -1}},
      {appCrashPolicy: {pageSwitchLogEnable: true, simplifyVmaPrinting: false, logFileCutoffSzBytes: -1}},

      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, logFileCutoffSzBytes: -1, simplifyVmaPrinting: true}},

      // appFreezePolicy 成功场景 - 空对象
      {appFreezePolicy: {}},

      {appFreezePolicy: undefined},

      // appFreezePolicy 成功场景 - 单参数
      {appFreezePolicy: {pageSwitchLogEnable: true}},
      {appFreezePolicy: {pageSwitchLogEnable: false}},

      // resourceOverlimitPolicy 成功场景 - 空对象
      {resourceOverlimitPolicy: {}},

      {resourceOverlimitPolicy: undefined},

      // resourceOverlimitPolicy 成功场景 - 单参数
      {resourceOverlimitPolicy: {pageSwitchLogEnable: true}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: false}},
      {resourceOverlimitPolicy: {jsHeapLogtype: "event"}},
      {resourceOverlimitPolicy: {jsHeapLogtype: "event_rawheap"}},

      // resourceOverlimitPolicy 成功场景 - 两参数组合
      {resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: "event"}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: "event_rawheap"}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: false, jsHeapLogtype: "event"}},

      // addressSanitizerPolicy 成功场景 - 空对象
      {addressSanitizerPolicy: {}},

      {addressSanitizerPolicy: undefined},

      // addressSanitizerPolicy 成功场景 - 单参数
      {addressSanitizerPolicy: {pageSwitchLogEnable: true}},
      {addressSanitizerPolicy: {pageSwitchLogEnable: false}},

      // 多策略组合
      {mainThreadJankPolicy: {}, cpuUsageHighPolicy: {}, appCrashPolicy: {}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}},
      {mainThreadJankPolicy: undefined, cpuUsageHighPolicy: undefined, appCrashPolicy: undefined, appFreezePolicy: undefined, resourceOverlimitPolicy: undefined, addressSanitizerPolicy: undefined },
      {mainThreadJankPolicy: {logType: 1}, cpuUsageHighPolicy: {foregroundLoadThreshold: 11}, appCrashPolicy: {pageSwitchLogEnable: true}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100}, cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22}, appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: true},
        resourceOverlimitPolicy: { pageSwitchLogEnable: true, jsHeapLogtype: "event" }},
      {resourceOverlimitPolicy: { pageSwitchLogEnable: true, jsHeapLogtype: "event" },
        mainThreadJankPolicy:{ logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: true }},
      {mainThreadJankPolicy:{ logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: true },
        cpuUsageHighPolicy: { foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadThreshold: 33, perfLogCaptureCount: 44, threadLoadInterval: 55}},
      {cpuUsageHighPolicy: { foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadThreshold: 33, perfLogCaptureCount: 44, threadLoadInterval: 55},
        appFreezePolicy:{ pageSwitchLogEnable: true }},
      {addressSanitizerPolicy:{ pageSwitchLogEnable: true },
        appFreezePolicy:{ pageSwitchLogEnable: true }},
      {addressSanitizerPolicy:{ pageSwitchLogEnable: true },
        appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: true}},
      {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: false},
        cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadThreshold:33, perfLogCaptureCount: 44, threadLoadInterval:55},
        appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, simplifyVmaPrinting: true, logFileCutoffSzBytes: 1024},
        appFreezePolicy: {pageSwitchLogEnable: true},
        resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: "event"},
        addressSanitizerPolicy: {pageSwitchLogEnable: true} }
    ];

    // configEventPolicy 1.1接口 返回401场景（参数为undefined）
    const policies_401: hiAppEvent.EventPolicy[] = [
      // mainThreadJankPolicy 401场景 - 单参数undefined
      {mainThreadJankPolicy: {logType: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined}},
      {mainThreadJankPolicy: {ignoreStartupTime: undefined}},
      {mainThreadJankPolicy: {sampleCount: undefined}},
      {mainThreadJankPolicy: {reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {autoStopSampling: undefined}},

      // mainThreadJankPolicy 401场景 - 多参数undefined
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined}},
      {mainThreadJankPolicy: {logType: undefined, ignoreStartupTime: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleCount: undefined}},
      {mainThreadJankPolicy: {logType: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {logType: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, ignoreStartupTime: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, sampleCount: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {ignoreStartupTime: undefined, sampleCount: undefined}},
      {mainThreadJankPolicy: {ignoreStartupTime: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {ignoreStartupTime: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleCount: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {sampleCount: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {reportTimesPerApp: undefined, autoStopSampling: undefined}},

      // mainThreadJankPolicy 401场景 - 三到六参数undefined
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, sampleCount: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, ignoreStartupTime: undefined, sampleCount: undefined}},
      {mainThreadJankPolicy: {logType: undefined, ignoreStartupTime: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {logType: undefined, ignoreStartupTime: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleCount: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleCount: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, ignoreStartupTime: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, ignoreStartupTime: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, sampleCount: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, sampleCount: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {ignoreStartupTime: undefined, sampleCount: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {ignoreStartupTime: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, sampleCount: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, sampleCount: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {logType: undefined, ignoreStartupTime: undefined, sampleCount: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, ignoreStartupTime: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, ignoreStartupTime: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},
      {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}},

      // cpuUsageHighPolicy 401场景 - 单参数undefined
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: undefined}},
      {cpuUsageHighPolicy: {threadLoadThreshold: undefined}},
      {cpuUsageHighPolicy: {perfLogCaptureCount: undefined}},
      {cpuUsageHighPolicy: {threadLoadInterval: undefined}},

      // cpuUsageHighPolicy 401场景 - 多参数undefined
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, threadLoadThreshold: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, perfLogCaptureCount: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: undefined, threadLoadThreshold: undefined}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: undefined, perfLogCaptureCount: undefined}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {threadLoadThreshold: undefined, perfLogCaptureCount: undefined}},
      {cpuUsageHighPolicy: {threadLoadThreshold: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {perfLogCaptureCount: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, threadLoadThreshold: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, perfLogCaptureCount: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, threadLoadThreshold: undefined, perfLogCaptureCount: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, threadLoadThreshold: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, perfLogCaptureCount: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: undefined, threadLoadThreshold: undefined, perfLogCaptureCount: undefined}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: undefined, threadLoadThreshold: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: undefined, perfLogCaptureCount: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {threadLoadThreshold: undefined, perfLogCaptureCount: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, threadLoadThreshold: undefined, perfLogCaptureCount: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, threadLoadThreshold: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, perfLogCaptureCount: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, threadLoadThreshold: undefined, perfLogCaptureCount: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {backgroundLoadThreshold: undefined, threadLoadThreshold: undefined, perfLogCaptureCount: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, threadLoadThreshold: undefined, perfLogCaptureCount: undefined, threadLoadInterval: undefined}},
      {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, threadLoadThreshold: undefined, perfLogCaptureCount: undefined, threadLoadInterval: undefined}},

      {appCrashPolicy: {pageSwitchLogEnable: undefined}},
      {appCrashPolicy: {extendPcLrPrinting: undefined}},
      {appCrashPolicy: {simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {logFileCutoffSzBytes: undefined}},
      {resourceOverlimitPolicy: {jsHeapLogtype: undefined}},

      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, logFileCutoffSzBytes: 0}},
      {appCrashPolicy: {pageSwitchLogEnable: false, logFileCutoffSzBytes: undefined}},
      {appCrashPolicy: {extendPcLrPrinting: undefined, logFileCutoffSzBytes: 5242880}},
      {appCrashPolicy: {extendPcLrPrinting: false, logFileCutoffSzBytes: undefined}},
      {appCrashPolicy: {extendPcLrPrinting: undefined, simplifyVmaPrinting: false}},
      {appCrashPolicy: {extendPcLrPrinting: false, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {simplifyVmaPrinting: undefined, logFileCutoffSzBytes: 5242880}},
      {appCrashPolicy: {simplifyVmaPrinting: false, logFileCutoffSzBytes: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, logFileCutoffSzBytes: undefined}},
      {appCrashPolicy: {extendPcLrPrinting: undefined, logFileCutoffSzBytes: undefined}},
      {appCrashPolicy: {extendPcLrPrinting: undefined, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {simplifyVmaPrinting: undefined, logFileCutoffSzBytes: undefined}},


      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: false, logFileCutoffSzBytes: 1024}},
      {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: undefined, logFileCutoffSzBytes: 1024}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: false, logFileCutoffSzBytes: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: true, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: undefined, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: true, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined,  logFileCutoffSzBytes: 1024, simplifyVmaPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: true,  logFileCutoffSzBytes: undefined, simplifyVmaPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: true,  logFileCutoffSzBytes: 1024, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {extendPcLrPrinting: undefined, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: false}},
      {appCrashPolicy: {extendPcLrPrinting: false, logFileCutoffSzBytes: undefined, simplifyVmaPrinting: false}},
      {appCrashPolicy: {extendPcLrPrinting: false, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: undefined}},

      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: 1024}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: undefined, logFileCutoffSzBytes: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: true, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined,  logFileCutoffSzBytes: undefined, simplifyVmaPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined,  logFileCutoffSzBytes: 1024, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {extendPcLrPrinting: undefined, logFileCutoffSzBytes: undefined, simplifyVmaPrinting: false}},
      {appCrashPolicy: {extendPcLrPrinting: undefined, logFileCutoffSzBytes: -1, simplifyVmaPrinting: undefined}},


      // 存在一个参数错误
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: false, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: undefined, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: true, logFileCutoffSzBytes: undefined, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: true, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: undefined}},

      //  同时存在两个参数错误-只有参数类型错误
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: true, logFileCutoffSzBytes: undefined, simplifyVmaPrinting: false}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: false, logFileCutoffSzBytes: 1024, simplifyVmaPrinting: undefined}},

      //  同时存在两个参数错误-参数类型错误和取值错误
      {appCrashPolicy: {logFileCutoffSzBytes: -1, pageSwitchLogEnable: undefined, extendPcLrPrinting: true, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: false, logFileCutoffSzBytes: 5242881, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: -1, simplifyVmaPrinting: true}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: 5242881, simplifyVmaPrinting: false}},

      //  同时存在三个参数错误-只有参数类型错误
      {appCrashPolicy: {pageSwitchLogEnable: false, extendPcLrPrinting: undefined, logFileCutoffSzBytes: undefined, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: true, logFileCutoffSzBytes: undefined, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: 0, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: undefined, simplifyVmaPrinting: false}},

      //  同时存在三个参数错误-参数类型错误和取值错误
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: -1, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: 5242881, simplifyVmaPrinting: undefined}},

      //  同时存在四个参数错误
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, logFileCutoffSzBytes: undefined, simplifyVmaPrinting: undefined}},
      {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: true, simplifyVmaPrinting: true, logFileCutoffSzBytes: -1}},

      {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined, jsHeapLogtype: "event"}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined, jsHeapLogtype: "event_rawheap"}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: undefined}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: false, jsHeapLogtype: undefined}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined, jsHeapLogtype: undefined}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined, jsHeapLogtype: undefined}},

      // appFreezePolicy 401场景
      {appFreezePolicy: {pageSwitchLogEnable: undefined}},

      // resourceOverlimitPolicy 401场景
      {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined}},
      {resourceOverlimitPolicy: {jsHeapLogtype: undefined}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined, jsHeapLogtype: undefined}},

      // addressSanitizerPolicy 401场景
      {addressSanitizerPolicy: {pageSwitchLogEnable: undefined}},

      // 多策略组合401场景
      {mainThreadJankPolicy: {logType: undefined}, cpuUsageHighPolicy: {}, appCrashPolicy: {}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}},
      {mainThreadJankPolicy: {}, cpuUsageHighPolicy: {foregroundLoadThreshold: undefined}, appCrashPolicy: {}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}},
      {mainThreadJankPolicy: {}, cpuUsageHighPolicy: {}, appCrashPolicy: {pageSwitchLogEnable: undefined}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}},
    ];

    // configEventPolicy 1.1接口 调用失败走失败分支打印hilog
    const policies_hilog: hiAppEvent.EventPolicy[] = [
      // mainThreadJankPolicy hilog场景 - logType超出范围
      {mainThreadJankPolicy: {logType: -1}},
      {mainThreadJankPolicy: {logType: 3}},
      {mainThreadJankPolicy: {logType: -1, sampleInterval: 100}},
      {mainThreadJankPolicy: {logType: 3, sampleInterval: 100}},
      {mainThreadJankPolicy: {logType: 1, sampleCount: 21}},

      // appCrashPolicy hilog场景 - logFileCutoffSzBytes超出范围
      {appCrashPolicy: {logFileCutoffSzBytes: -1}},
      {appCrashPolicy: {logFileCutoffSzBytes: 5242881}},
      {appCrashPolicy: {logFileCutoffSzBytes: 5242880 + 1}},
      {appCrashPolicy: {pageSwitchLogEnable: true, logFileCutoffSzBytes: -1}},
      {appCrashPolicy: {pageSwitchLogEnable: true, logFileCutoffSzBytes: 5242881}},

      // resourceOverlimitPolicy hilog场景 - jsHeapLogtype无效值
      {resourceOverlimitPolicy: {jsHeapLogtype: "invalid"}},
      {resourceOverlimitPolicy: {jsHeapLogtype: ""}},
      {resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: "invalid"}},

      // 多策略组合hilog场景
      {mainThreadJankPolicy: {logType: -1}, cpuUsageHighPolicy: {}, appCrashPolicy: {}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}},
      {mainThreadJankPolicy: {}, cpuUsageHighPolicy: {}, appCrashPolicy: {logFileCutoffSzBytes: -1}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}},
      {mainThreadJankPolicy: {}, cpuUsageHighPolicy: {}, appCrashPolicy: {}, appFreezePolicy: {}, resourceOverlimitPolicy: {jsHeapLogtype: "invalid"}, addressSanitizerPolicy: {}},
      {mainThreadJankPolicy: undefined, cpuUsageHighPolicy: {}, appCrashPolicy: {logFileCutoffSzBytes: -1}, appFreezePolicy: undefined, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {} },
      {mainThreadJankPolicy: undefined, cpuUsageHighPolicy: undefined, appCrashPolicy: undefined, appFreezePolicy: undefined, resourceOverlimitPolicy: {jsHeapLogtype: "invalid"}, addressSanitizerPolicy: undefined }
    ];


    /**
     * @tc.number  SUB_DFX_DFT_HiAppEvent_SetEventConfigSuccess_1000
     * @tc.name SUB_DFX_DFT_HiAppEvent_SetEventConfigSuccess_1000
     * @tc.desc SUB_DFX_DFT_HiAppEvent_SetEventConfigSuccess_1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_SetEventConfigSuccess_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====> configEventPolicy1.1_401_test start");
      for (let i = 0; i < config_true.length; i++) {
        const entries = Object.entries(config_true[i]);
        console.info("SUB_DFX_DFT_HiAppEvent_SetEventConfigSuccess_1000 Successfully set event policy111, index:", i);
        for (let j = 0; j < entries.length; j++) {
          const eventName = entries[j][0];
          const params = entries[j][1];
          await hiAppEvent.setEventConfig(eventName, params).then(() => {
            console.info("SUB_DFX_DFT_HiAppEvent_SetEventConfigSuccess_1000 config_true Successfully set event policy, index:", i);
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, 'configEventPolicy1.1',
              `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
            console.info("SUB_DFX_DFT_HiAppEvent_SetEventConfigSuccess_1000 config_true Failed to set event policy, index:", i);
            expect(false).assertEqual(true);
          });
        }
      }
      done();
      console.info("====> SUB_DFX_DFT_HiAppEvent_SetEventConfigSuccess_1000 end");
    });

    /**
     * @tc.number  SUB_DFX_DFT_HiAppEvent_SetEventConfigFail_1000
     * @tc.name SUB_DFX_DFT_HiAppEvent_SetEventConfigFail_1000
     * @tc.desc SUB_DFX_DFT_HiAppEvent_SetEventConfigFail_1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_SetEventConfigFail_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HiAppEvent_SetEventConfigFail_1000 start");
      for (let i = 0; i < config_401.length; i++) {
        const entries = Object.entries(config_401[i]);
        console.info("SUB_DFX_DFT_HiAppEvent_SetEventConfigFail_1000 Successfully set event policy111, index:", i);
        for (let j = 0; j < entries.length; j++) {
          const eventName = entries[j][0];
          const params = entries[j][1];
          await hiAppEvent.setEventConfig(eventName, params).then(() => {
            console.info("SUB_DFX_DFT_HiAppEvent_SetEventConfigFail_1000 config_401 Successfully set event policy, index:", i);
          }).catch((err: BusinessError) => {
            hilog.error(0x0000, 'SUB_DFX_DFT_HiAppEvent_SetEventConfigFail_1000',
              `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
            console.info("configEventPolicy1.1_401_test config_401 Failed to set event policy, index:", i);
            expect(Number(err.code) === 401).assertEqual(true);
          });
        }
      }
      done();
      console.info("====> configEventPolicy1.1_401_test end");
    });

    /**
     * @tc.number   SUB_DFX_DFT_HiAppEvent_ConfigEventPolicySuccess_1000
     * @tc.name SUB_DFX_DFT_HiAppEvent_ConfigEventPolicySuccess_1000
     * @tc.desc SUB_DFX_DFT_HiAppEvent_ConfigEventPolicySuccess_1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_ConfigEventPolicySuccess_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HiAppEvent_ConfigEventPolicySuccess_1000 start");
      for (let i = 0; i < policies_true.length; i++) {
        const policy = policies_true[i];
        await hiAppEvent.configEventPolicy(policy).then(() => {
          console.info("SUB_DFX_DFT_HiAppEvent_ConfigEventPolicySuccess_1000 policies_true Successfully set event policy222, index:", i);
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'configEventPolicy1.1', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
          expect(false).assertEqual(true);
        });
      }
      done();
      console.info("====> SUB_DFX_DFT_HiAppEvent_ConfigEventPolicySuccess_1000 end");
    });

    /**
     * @tc.number   SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFail_1000
     * @tc.name SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFail_1000
     * @tc.desc SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFail_1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFail_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFail_1000 start");
      for (let i = 0; i < policies_hilog.length; i++) {
        const policy = policies_hilog[i];
        await hiAppEvent.configEventPolicy(policy).then(() => {
          expect(false).assertEqual(true);
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'configEventPolicy1.1', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}, index: ${i}`);
        });
      }
      done();
      console.info("====> SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFail_1000 end");
    });

    /**
     * @tc.number   SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFalse_1000
     * @tc.name SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFalse_1000
     * @tc.desc SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFalse_1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFalse_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFalse_1000 start");
      for (let i = 0; i < policies_401.length; i++) {
        const policy = policies_401[i];
        await hiAppEvent.configEventPolicy(policy).then(() => {
          console.info("SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFalse_1000 policies_401 Successfully set event policy, index:", i);
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'configEventPolicy1.1', `Failed to set event policy. Code: ${err?.code}, message: ${err?.message}`);
          console.info("SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFalse_1000 policies_401 Failed to set event policy, index:", i);
          expect(Number(err.code) === 401).assertEqual(true);
        });
      }
      done();
      console.info("====> SUB_DFX_DFT_HiAppEvent_ConfigEventPolicyFalse_1000 end");
    });


  })
}