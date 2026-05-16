/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import inspectorTestJsunit from './inspectorTest/inspector.test';
import LayoutInspectorTest from './layoutInspector/layoutInspector.test';
import assemblyCallbackTest from './assemblycallback/assemblycallback.test';
import enumTest from './enumTest/enum.test';
import LayoutChildrenTest from './assemblycallback/LayoutChildren.test';
import drawChildrenTest from './CreateComponentObserver/drawChildren.test';
import xComponentNodeOnCreateNullUndefinedTest from './nullandundefinedcoverage/xcomponent/XComponentNodeOnCreateNullUndefined.test';
import xComponentNodeChangeRenderTypeNullUndefinedTest from './nullandundefinedcoverage/xcomponent/XComponentNodeChangeRenderTypeNullUndefined.test';
import accessibilityTextNullUndefinedTest from './nullandundefinedcoverage/accessibility/AccessibilityTextNullUndefined.test';
import accessibilityStateDescriptionNullUndefinedTest from './nullandundefinedcoverage/accessibility/AccessibilityStateDescriptionNullUndefined.test';
import accessibilityActionOptionsNullUndefinedTest from './nullandundefinedcoverage/accessibility/AccessibilityActionOptionsNullUndefined.test';
import accessibilityDefaultFocusFalseTest from './nullandundefinedcoverage/accessibility/AccessibilityDefaultFocusFalse.test';
import accessibilityGroupNullUndefinedTest from './nullandundefinedcoverage/accessibility/AccessibilityGroupNullUndefined.test';
import uiContextNullUndefinedTest from './nullandundefinedcoverage/UIContext/UIContextNullUndefinedTest.test';
import accessibilityFocusDrawLevelNullUndefinedTest from './nullandundefinedcoverage/accessibility/AccessibilityFocusDrawLevelNullUndefined.test';
import componentObserverNullUndefinedTest from './nullandundefinedcoverage/ComponentObserver/ComponentObserverNullUndefinedTest.test';
import pluginComponentManagerNullUndefinedTest from './nullandundefinedcoverage/pluginComponentManager/PluginComponentManagerNullUndefined.test';
import uiInspectorNullUndefinedTest from './nullandundefinedcoverage/UIInspector/UIInspectorNullUndefined.test';
import inspectorCreateComponentObserverNullUndefinedTest from './nullandundefinedcoverage/inspector/InspectorCreateComponentObserverNullUndefined.test';
import embeddedComponentTerminationInfoTest from './EmbeddedComponentTest/EmbeddedComponentTerminationInfo.test';
import pluginComponentManagerParamTest from './nullandundefinedcoverage/pluginComponentManager/PluginComponentManagerParam.test';
import XComponentAttributeTest from './nullandundefinedcoverage/xcomponent/XComponentAttributeTest.test';
import getFilteredInspectorTreeByIdDepthBoundaryTest from './UIContext/GetFilteredInspectorTreeByIdDepthBoundaryTest.test';
import inspectorLabelTest from './inspectorLabel/inspectorLabelTest.test';


export default function testsuite() {
  inspectorTestJsunit();
  LayoutInspectorTest();
  assemblyCallbackTest();
  enumTest();
  drawChildrenTest();
  xComponentNodeChangeRenderTypeNullUndefinedTest();
  xComponentNodeOnCreateNullUndefinedTest();
  accessibilityTextNullUndefinedTest();
  accessibilityStateDescriptionNullUndefinedTest();
  accessibilityActionOptionsNullUndefinedTest();
  accessibilityDefaultFocusFalseTest();
  accessibilityGroupNullUndefinedTest();
  uiContextNullUndefinedTest();
  accessibilityFocusDrawLevelNullUndefinedTest();
  componentObserverNullUndefinedTest();
  pluginComponentManagerNullUndefinedTest();
  uiInspectorNullUndefinedTest();
  inspectorCreateComponentObserverNullUndefinedTest();
  embeddedComponentTerminationInfoTest();
  pluginComponentManagerParamTest();
  XComponentAttributeTest();
  LayoutChildrenTest();
  getFilteredInspectorTreeByIdDepthBoundaryTest();
  inspectorLabelTest();
}