'use static';
import TextCommonTest from './TextCommonTest/TextCommon.test';
import TextCommonUITest from './TextCommonTest/TextCommonUI.test';
import EditDecorationThicknessScaleTest from './EditCommonTest/EditDecorationThicknessScale.test';
import SetTextSelectionClearPolicyTest from './UIContext/SetTextSelectionClearPolicy.test';

export default function testsuite() {
  TextCommonTest();
  TextCommonUITest();
  EditDecorationThicknessScaleTest();
  SetTextSelectionClearPolicyTest();
}