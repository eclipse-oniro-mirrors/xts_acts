import { hilog } from '@kit.PerformanceAnalysisKit';
import PartnerAgentExtensionAbility from '@ohos.application.PartnerAgentExtensionAbility'
import extensionSubscription from '@ohos.notificationExtensionSubscription';

const DOMAIN = 0x0000;
const TAG = 'PartnerAgentExtAbility';

export default class PartnerAgentExtAbility extends PartnerAgentExtensionAbility {
  onDestroyWithReason(reason: partnerAgent.PartnerAgentExtensionAbilityDestroyReason): void {
    hilog.info(DOMAIN, 'testTag', `${TAG} onDestroyWithReason. PartnerAgentExtensionAbilityDestroyReason: ${JSON.stringify(reason)}`);
  }
  onDeviceDiscovered(deviceAddress: partnerAgent.PartnerDeviceAddress): void {
    console.info(`onDeviceDiscovered success: ${deviceAddress.bluetoothAddress}`);
    hilog.info(DOMAIN, 'testTag', `${TAG} onDeviceDiscovered. PartnerDeviceAddress: ${JSON.stringify(deviceAddress)}`);
  }
}