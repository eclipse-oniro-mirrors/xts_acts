import hilog from '@ohos.hilog'
import FaultLogExtensionAbility from '@ohos.hiviewdfx.FaultLogExtensionAbility';
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent';
import bundleManager from '@ohos.bundle.bundleManager';
let domain: int = 0xA8A8;
let extensionAbilityType = bundleManager.ExtensionAbilityType.FAULT_LOG;
const TAG = 'MyFaultLogExtension';

export default class MyFaultLogExtension extends FaultLogExtensionAbility {
  onFaultReportReady() {
    // Log.i(TAG, `ONFAULT  cache dir is ${this.context.cacheDir}`);
    hilog.info(domain, TAG, 'xxxxxxxxxxxxx ONFAULT  cache dir is ${this.context.cacheDir}');
    hilog.info(domain, TAG, 'xxxxxxxxxxxxx ONFAULT  cache dir is ' + this.context.cacheDir);
    let context = this.context;
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
      // 开发者可以自行实现订阅系统事件回调函数，以便对订阅获取到的事件数据进行自定义处理
      onReceive: (domain_s: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
        hilog.info(domain, TAG, `HiAppEvent onReceive: domain=` + domain_s);
        for (const eventGroup of appEventGroups) {
          // 开发者可以根据事件集合中的事件名称区分不同的系统事件
          hilog.info(0xA8A8, 'testTag', `HiAppEvent eventName=${eventGroup.name}`);
          for (const eventInfo of eventGroup.appEventInfos) {
            // 开发者可以对事件集合中的事件数据进行自定义处理，此处是将事件数据打印在日志中
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.domain=${eventInfo.domain}`);
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.name=${eventInfo.name}`);
            hilog.info(0xA8A8, 'ZCK testTag', `HiAppEvent eventInfo.eventType=${eventInfo.eventType}`);
          }
        }
      }
    });
  }

  onConnect() {
    hilog.info(domain, TAG, 'onConnect xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    hilog.info(domain, TAG, 'onConnect xxxx, FAULT_LOG type is  ' + extensionAbilityType +", current ability type is "  + this.context.extensionAbilityInfo.extensionAbilityType);
  }

  onDisconnect() {
    hilog.info(domain, TAG, 'onDisconnect xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
  }
}
