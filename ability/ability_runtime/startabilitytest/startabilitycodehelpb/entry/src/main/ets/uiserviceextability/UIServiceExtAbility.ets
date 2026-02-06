import { common, UIServiceExtensionAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

export default class UIServiceExtAbility extends UIServiceExtensionAbility {
  // 创建UIServiceExtensionAbility
  onCreate(want: Want) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  // 请求处理
  onRequest(want: Want, startId: number) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onRequest');
  }

  // 连接
  onConnect(want: Want, proxy: common.UIServiceHostProxy) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onConnect');
  }

  // 断开连接
  onDisconnect(want: Want, proxy: common.UIServiceHostProxy) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDisconnect');
  }

  // 窗口即将创建
  onWindowWillCreate(config: window.ExtensionWindowConfig): void {
    hilog.info(0x0000, 'TestTag', '%{public}s', 'Ability onWindowWillCreate');
    let rect: window.Rect = {
      left: 100,
      top: 100,
      width: 500,
      height: 500
    };
    config.windowRect = rect;
    // 创建子窗
    config.windowName = 'sub_window'
    config.windowAttribute = window.ExtensionWindowAttribute.SUB_WINDOW;
    config.windowRect = rect;
    config.subWindowOptions = {
      title: 'sub_window_title',
      decorEnabled: true,
      // 是否模态窗口
      isModal: false
    }
    hilog.info(0x0000, 'TestTag', '%{public}s', 'Ability onWindowWillCreate end');
  }

  // 窗口创建完成
  onWindowDidCreate(window: window.Window) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowDidCreate');
    window.setUIContent('pages/WindowPage')
    window.showWindow()
  }

  // 接收数据
  onData(proxy: common.UIServiceHostProxy, data: Record<string, Object>) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onData');

  }

  // 销毁
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    AppStorage.setOrCreate('logText', 'UIServiceExtensionAbility Ability onDestroy');
  }
}