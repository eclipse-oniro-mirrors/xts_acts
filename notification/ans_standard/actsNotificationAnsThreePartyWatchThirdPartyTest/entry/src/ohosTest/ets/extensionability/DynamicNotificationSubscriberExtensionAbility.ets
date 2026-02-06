import NotificationSubscriberExtensionAbility from '@ohos.application.NotificationSubscriberExtensionAbility';
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';

const DOMAIN = 0x0000;

export default class DynamicNotificationSubscriberExtensionAbility extends NotificationSubscriberExtensionAbility {

  onDestroy(): void {
    console.log(`ansTest 1.1 on destory`)
  }

  onReceiveMessage(notificationInfo: notificationExtensionSubscription.NotificationInfo): void {
    console.log(`ansTest 1.1 on receive message ${JSON.stringify(notificationInfo)}`)
  }

  /**
   * Called back when notifications is cancelled.
   *
   * @param { Array<string> } hashCodes - The list of notification to be cancelled.
   * @syscap SystemCapability.Notification.Notification
   * @stagemodelonly
   * @since 22
   */
  onCancelMessages(hashCodes: Array<string>): void {
    console.log(`ansTest 1.1 on cancel message ${JSON.stringify(hashCodes)}`)
  }

}