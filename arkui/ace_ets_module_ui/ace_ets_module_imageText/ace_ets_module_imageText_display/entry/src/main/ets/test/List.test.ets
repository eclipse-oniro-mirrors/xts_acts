/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import InputPresetTest from './PresetTest/InputPresetTest.test';

import PreventDefault from './HyperlinkTest/PreventDefault.test';

import MarqueeApi from './MarqueeTest/MarqueeApi.test';
import MarqueeDynamicSyncSceneTest from './MarqueeTest/MarqueeDynamicSyncSceneType.test';
import SetFrameRateRangeTest from './MarqueeTest/MarqueeFrame.test';
import MarqueeJsunit from './MarqueeTest/MarqueeJsunit.test';
import MarqueeMirroringTest from './MarqueeTest/MarqueeMirroring.test';
import MarqueeModifierTest from './MarqueeTest/MarqueeModifier.test';
import MarqueeNodeTest from './MarqueeTest/MarqueeNode.test';
import MarqueeOptionsTest1 from './MarqueeTest/MarqueeOptions1.test';
import MarqueeOptionsTest2 from './MarqueeTest/MarqueeOptions2.test';
import MarqueeUIJsunit from './MarqueeTest/MarqueeUIJsunit.test';
import MarqueeUpdatePolicyTest from './MarqueeTest/MarqueeUpdatePolicy.test';

import BounceSymbolEffectTest from './SymbolGlyphTest/BounceSymbolEffect.test';
import EffectFillStyle from './SymbolGlyphTest/EffectFillStyle.test';
import EffectScope from './SymbolGlyphTest/EffectScope.test';
import SymbolGlyphFontWeightTest from './SymbolGlyphTest/FontWeight.test';
import SXSymbolGlyphSINGLE01Jsunit from './SymbolGlyphTest/SXSymbolGlyphSINGLE01Jsunit.test';
import SymbolEffect from './SymbolGlyphTest/SymbolEffect.test';
import SymbolGlyphApi from './SymbolGlyphTest/SymbolGlyphApi.test';
import SymbolGlyphApi1 from './SymbolGlyphTest/SymbolGlyphApi1.test';
import SymbolGlyphApi2 from './SymbolGlyphTest/SymbolGlyphApi2.test';
import SymbolGlyphApi3 from './SymbolGlyphTest/SymbolGlyphApi3.test';
import SymbolGlyphApi4 from './SymbolGlyphTest/SymbolGlyphApi4.test';
import SymbolGlyphApi5 from './SymbolGlyphTest/SymbolGlyphApi5.test';
import SymbolGlyphFontScaleTest from './SymbolGlyphTest/SymbolGlyphFontScaleTest.test';
import SymbolGlyphNodeTest from './SymbolGlyphTest/SymbolGlyphNode.test';

export default function testsuite() {
  InputPresetTest()
  //HyperlinkTest
  PreventDefault()
  //MarqueeTest
  MarqueeApi()
  MarqueeDynamicSyncSceneTest()
  SetFrameRateRangeTest()
  MarqueeJsunit()
  MarqueeMirroringTest()
  MarqueeModifierTest()
  MarqueeNodeTest()
  MarqueeOptionsTest1()
  MarqueeOptionsTest2()
  MarqueeUIJsunit()
  MarqueeUpdatePolicyTest()
  //SymbolGlyphTest
  BounceSymbolEffectTest()
  EffectFillStyle()
  EffectScope()
  SymbolGlyphFontWeightTest()
  SXSymbolGlyphSINGLE01Jsunit()
  SymbolEffect()
  SymbolGlyphApi()
  SymbolGlyphApi1()
  SymbolGlyphApi2()
  SymbolGlyphApi3()
  SymbolGlyphApi4()
  SymbolGlyphApi5()
  SymbolGlyphFontScaleTest()
  SymbolGlyphNodeTest()
}