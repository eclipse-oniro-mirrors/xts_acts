import abilityTest from './Ability.test';
import onConnectParameterTest from './OnConnectParameter.test';
import onFailedParameterTest from './OnFailedParameter.test';
import connectNativeParameterTest from './ConnectNativeParameter.test';
import OnDisconnectParameter from './OnDisconnectParameter.test'
import DisconnectNativeParameter from './DisconnectNativeParameter.test'
import ConnectNativeErrorCode from './ConnectNativeErrorCode.test'
import DisconnectNativeErrorCode from './DisconnectNativeErrorCode.test'
import webExtensionConnectionCallbackOnConnectParameterTest from './WebExtensionConnectionCallbackOnConnectParameter.test'
import webExtensionConnectionCallbackOnDisconnectParameterTest from './WebExtensionConnectionCallbackOnDisconnectParameter.test'
import webExtensionConnectionCallbackOnFailedParameterTest from './WebExtensionConnectionCallbackOnFailedParameter.test'
import connectNativeNullUndefinedParameterTest from './ConnectNativeNullUndefinedParameter.test'
import disconnectNativeNullUndefinedParameterTest from './DisconnectNativeNullUndefinedParameter.test'
import startAbilityForResultParameterTest from './StartAbilityForResultParameter.test'
import startAbilityForResultPromiseParameterTest from './StartAbilityForResultPromiseParameter.test'
import startAbilityForResultReturnTest from './StartAbilityForResultReturn.test'

export default function testsuite() {
  abilityTest();
  onConnectParameterTest();
  onFailedParameterTest();
  connectNativeParameterTest();
  OnDisconnectParameter()
  DisconnectNativeParameter()
  ConnectNativeErrorCode()
  DisconnectNativeErrorCode()
  webExtensionConnectionCallbackOnConnectParameterTest()
  webExtensionConnectionCallbackOnDisconnectParameterTest()
  webExtensionConnectionCallbackOnFailedParameterTest()
  connectNativeNullUndefinedParameterTest()
  disconnectNativeNullUndefinedParameterTest()
  startAbilityForResultParameterTest()
  startAbilityForResultPromiseParameterTest()
  startAbilityForResultReturnTest()
}