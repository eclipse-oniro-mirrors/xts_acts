'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import subHeaderV2EfficiencyTest from './subHeaderV2/subHeaderV2Efficiency.test';
import subHeaderV2DoubleLinesTest from './subHeaderV2/subHeaderV2DoubleLines.test';
import subHeaderV2SpinnerTest from './subHeaderV2/subHeaderV2Spinner.test';
import subHeaderV2LeftSymbolTest from './subHeaderV2/subHeaderV2LeftSymbol.test';
import subHeaderV2RightSymbolTest from './subHeaderV2/subHeaderV2RightSymbol.test';
import subHeaderV2CustomContentTest from './subHeaderV2/subHeaderV2CustomContent.test';
import subHeaderV2CustomStyleTest from './subHeaderV2/subHeaderV2CustomStyle.test';
import subHeaderV2LeftAccessTest from './subHeaderV2/subHeaderV2LeftAccess.test';
import subHeaderV2RightAccessTest from './subHeaderV2/subHeaderV2RightAccess.test';

export default function testsuite() {
  subHeaderV2EfficiencyTest();
  subHeaderV2DoubleLinesTest();
  subHeaderV2SpinnerTest();
  subHeaderV2LeftSymbolTest();
  subHeaderV2RightSymbolTest();
  subHeaderV2CustomContentTest();
  subHeaderV2CustomStyleTest();
  subHeaderV2LeftAccessTest();
  subHeaderV2RightAccessTest();
}