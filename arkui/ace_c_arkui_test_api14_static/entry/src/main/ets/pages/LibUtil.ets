'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Content } from '@ohos.arkui.node'

export class LibUtil {
  static{
    loadLibrary("entry");
  }

  native testNativeXComponent_RegisterKeyEventCallbackWithResult001 (): int;

  native tabStop_001(): int;

  native testGetCustomProperty (a: Content): void;

  native testGetParentInPageTree (a: Content): void;

  native testGetActiveChildrenInfo (a: Content): void;

  native testGetCurrentPageRootNode (a: Content): void;

  native testIsCreatedByNDK (a: Content): void;

  native testGetNodeType (a: Content): void;

  native testCustomPropertyDestroy (a: Content): void;

  native testCustomPropertyGetStringValue (a: Content): void;

  native testActiveChildrenInfoDestroy (a: Content): void;

  native testActiveChildrenInfoGetNodeByIndex (a: Content): void;

  native testActiveChildrenInfoGetCount (a: Content): void;

  native KeyEventGetTypeTest_001 (a: Content): void;

  native KeyEventGetKeyCodeTest_001 (a: Content): void;

  native KeyEventGetKeyTextTest_001 (a: Content): void;

  native KeyEventGetKeySourceTest_001 (a: Content): void;

  native KeyEventGetGetDeviceIdTest_001 (a: Content): void;

  native KeyEventStopPropagationTest_001 (a: Content): void;

  native KeyEventGetPressedKeysTest_001 (a: Content): void;

  native KeyEventGetKeyIntensionCodeTest_001 (a: Content): void;

  native KeyEventGetUnicodeTest_001 (a: Content): void;

  native KeyEventSetConsumedTest_001 (a: Content): void;

  native testGetScrollSizeTest001 (a: Content): void;
}