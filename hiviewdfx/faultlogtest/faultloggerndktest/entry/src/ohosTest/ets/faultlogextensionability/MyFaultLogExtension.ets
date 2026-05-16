import { FaultLogExtensionAbility, hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit'
const TAG = 'MyFaultLogExtension';

export default class MyFaultLogExtension extends FaultLogExtensionAbility {
  onFaultReportReady() {
    hilog.info(0xA8A8, 'ZCK0908  onFaultReportReady_begin is', `onFaultReportReady_begin  11111 `);
    hilog.info(0xA8A8, 'ZCK0908  onFaultReportReady_begin is', `ONFAULT  cache dir is   ${this.context.cacheDir} `);
    hiAppEvent.addWatcher({

      // 开发者可以自定义观察者名称，系统会使用名称来标识不同的观察者
      name: "watcher",
      // 开发者可以订阅感兴趣的系统事件，此处是订阅了踩内存事件
      appEventFilters: [
        {
          domain: hiAppEvent.domain.OS,
          names: [hiAppEvent.event.APP_CRASH, hiAppEvent.event.APP_FREEZE]
        }
      ],
      // 开发者可以自行实现订阅实时回调函数，以便对订阅获取到的事件数据进行自定义处理
      onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
        hilog.info(0xA8A8, 'testTag', `HiAppEvent onReceive: domain=${domain}`);
        for (const eventGroup of appEventGroups) {
          // 开发者可以根据事件集合中的事件名称区分不同的系统事件
          hilog.info(0xA8A8, 'testTag', `HiAppEvent eventName=${eventGroup.name}`);
          for (const eventInfo of eventGroup.appEventInfos) {
            // 开发者可以对事件集合中的事件数据进行自定义处理，此处是将事件数据打印在日志中
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.domain=${eventInfo.domain}`);
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.name=${eventInfo.name}`);
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.eventType=${eventInfo.eventType}`);
            // 开发者可以获取到卡死事件发生的时间戳
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.time=${eventInfo.params['time']}`);
            // 开发者可以获取到卡死应用的前后台状态
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.foreground=${eventInfo.params['foreground']}`);
            // 开发者可以获取到卡死应用的版本信息
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.bundle_version=${eventInfo.params['bundle_version']}`);
            // 开发者可以获取到卡死应用的包名
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.bundle_name=${eventInfo.params['bundle_name']}`);
            // 开发者可以获取到卡死应用的进程名称
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.process_name=${eventInfo.params['process_name']}`);
            // 开发者可以获取到卡死应用的进程id
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.pid=${eventInfo.params['pid']}`);
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.uid=${eventInfo.params['uid']}`);
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.uuid=${eventInfo.params['uuid']}`);
            // 开发者可以获取到卡死事件发生的异常类型、异常原因
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.exception=${JSON.stringify(eventInfo.params['exception'])}`);
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.params.external_log=${JSON.stringify(eventInfo.params['external_log'])}`);
          }
        }
      }
    });
    hilog.info(0xA8A8, 'ZCK0908  onFaultReportReady_end is', `onFaultReportReady_end 22222 `);

  }

  onConnect() {
    hilog.info(0xA8A8, 'ZCK0908   onConnect_begin is', `onConnect_begin 33333 `);

  }

  onDisconnect() {
    hilog.info(0xA8A8, 'ZCK0908   onConnect_end is', `onConnect_end 4444`);
  }


}
