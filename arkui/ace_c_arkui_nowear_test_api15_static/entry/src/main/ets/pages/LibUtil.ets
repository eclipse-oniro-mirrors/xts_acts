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
  static {
    loadLibrary("entry")
  }

  native KeyProcessingMode001(a: Content): void;

  native KeyProcessingMode002(a: Content): void;

  native scrollBackToTopTest(a: Content): void;

  native FocusControlTest_003(a: Content): void;

  native FocusControlTest_004(a: Content): void;

  native GetGestureParamTest_a(): int;

  native GetGestureParamTest_a1(): int;

  native GetGestureParamTest_b(): int;

  native GetGestureParamTest_c(): int;

  native GetGestureParamTest_d(): int;

  native GetGestureParamTest_e(): int;

  native GetGestureParamTest_f(): int;

  native GetGestureParamTest_g(): int;

  native GetGestureParamTest_h(): int;

  native GetGestureParamTest_i(): int;

  native GetGestureParamTest_j(): int;

  native GetGestureParamTest_j1(): int;
}