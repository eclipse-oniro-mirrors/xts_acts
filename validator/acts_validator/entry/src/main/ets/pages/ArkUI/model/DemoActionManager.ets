import accessibility from '@ohos.accessibility';

export default class DemoActionManager {
  private static instance: DemoActionManager;

  static getInstance(): DemoActionManager {
    if (!DemoActionManager.instance) {
      DemoActionManager.instance = new DemoActionManager();
    }
    return DemoActionManager.instance;
  }

  async sendEvent(funName: string): Promise<void> {
    let eventInfo: accessibility.EventInfo = ({
      type: 'requestFocusForAccessibility',
      bundleName: 'com.ohos.myapplication',
      triggerAction: 'common',
      textAnnouncedForAccessibility: funName
    });

    accessibility.sendAccessibilityEvent(eventInfo).then(() => {
      console.info(`yly Succeeded in send event, eventInfo is ${JSON.stringify(eventInfo)}`);
    })
    return;
  }
}