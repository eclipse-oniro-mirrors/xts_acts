import SetOverlayEnabled from './SetOverlayEnabled.test';
import GetOverlayModuleInfo from './GetOverlayModuleInfo.test';
import GetTargetOverlayModuleInfos from './GetTargetOverlayModuleInfos.test';

export default function testsuite() {
  SetOverlayEnabled();
  GetOverlayModuleInfo();
  GetTargetOverlayModuleInfos();
}