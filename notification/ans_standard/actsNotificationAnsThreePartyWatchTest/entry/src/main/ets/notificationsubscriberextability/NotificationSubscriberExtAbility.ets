import { hilog } from '@kit.PerformanceAnalysisKit';
import NotificationSubscriberExtensionAbility from '@ohos.application.NotificationSubscriberExtensionAbility'
import extensionSubscription from '@ohos.notificationExtensionSubscription';

const DOMAIN = 0x0000;
const TAG = 'NotificationSubscriberExtAbility';

export default class NotificationSubscriberExtAbility extends NotificationSubscriberExtensionAbility {
  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', `${TAG} onDestroy`);
  }

  onReceiveMessage(notificationInfo: extensionSubscription.NotificationInfo): void {
    hilog.info(DOMAIN, 'testTag', `${TAG} onReceiveMessage. notificationInfo: ${JSON.stringify(notificationInfo)}`);
  }

  onCancelMessages(hashCodes: Array<string>): void {
    hilog.info(DOMAIN, 'testTag', `${TAG} onCancelMessages. hashCodes: ${JSON.stringify(hashCodes)}`);
  }
}