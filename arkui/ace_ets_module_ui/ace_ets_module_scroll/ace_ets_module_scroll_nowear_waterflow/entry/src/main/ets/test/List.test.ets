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

import ScrollToIndexForWaterFlowJsunit01 from './ScrollToIndex/ScrollToIndexForWaterFlowJsunit01.test';
import ScrollToIndexForWaterFlowJsunit02 from './ScrollToIndex/ScrollToIndexForWaterFlowJsunit02.test';
import waterFlowLayoutMode from './WaterFlow/waterFlowLayoutMode.test';
import waterFlow1Jsunit from './WaterFlow/waterFlow1Jsunit.test';
import waterFlow2Jsunit from './WaterFlow/waterFlow2Jsunit.test';
import waterFlow3Jsunit from './WaterFlow/waterFlow3Jsunit.test';
import waterFlow4Jsunit from './WaterFlow/waterFlow4Jsunit.test';
import waterFlow5Jsunit from './sectionOptions/waterFlow5Jsunit.test';
import waterFlow6Jsunit from './sectionOptions/waterFlow6Jsunit.test';
import WaterFlowSectionDemo02Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo02Jsunit.test'
import WaterFlowSectionDemo03Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo03Jsunit.test'
import WaterFlowSectionDemo04Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo04Jsunit.test'
import WaterFlowSectionDemo05Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo05Jsunit.test'
import WaterFlowSectionDemo06Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo06Jsunit.test'
import WaterFlowSectionDemo09Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo09Jsunit.test'
import WaterFlowSectionDemo11Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo11Jsunit.test'
import WaterFlowSectionDemo12Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo12Jsunit.test'
import WaterFlowSectionDemo13Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo13Jsunit.test'
import WaterFlowSectionDemo14Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo14Jsunit.test'
import WaterFlowSectionDemo16Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo16Jsunit.test'
import WaterFlowSectionDemo17Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo17Jsunit.test'
import WaterFlowSectionDemo20Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo20Jsunit.test'
import WaterFlowSectionDemo23Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo23Jsunit.test'
import WaterFlowSectionDemo25Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo25Jsunit.test'
import WaterFlowSectionDemo26Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo26Jsunit.test'
import WaterFlowSectionDemo27Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo27Jsunit.test'
import WaterFlowSectionDemo28Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo28Jsunit.test'
import WaterFlowSectionDemo30Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo30Jsunit.test'
import WaterFlowSectionDemo31Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo31Jsunit.test'
import WaterFlowSectionDemo32Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo32Jsunit.test'
import WaterFlowSectionDemo33Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo33Jsunit.test'
import WaterFlowSectionDemo35Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo35Jsunit.test'
import WaterFlowSectionDemo37Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo37Jsunit.test'
import WaterFlowSectionDemo42Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo42Jsunit.test'
import WaterFlowSectionDemo43Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo43Jsunit.test'
import WaterFlowSectionDemo45Jsunit from './WaterFlowSectionDemo/WaterFlowSectionDemo45Jsunit.test'
import onScrollIndexFlow1 from './onScrollIndex/onScrollIndexFlow1.test';
import onScrollIndexFlow2 from './onScrollIndex/onScrollIndexFlow2.test';
import onScrollIndexFlow3 from './onScrollIndex/onScrollIndexFlow3.test';
import repeatWaterFlow from './waterFlowCallback/repeatWaterFlow.test';
import waterFlowScroll from './waterFlowCallback/waterFlowScroll.test';
import waterFlowStart1 from './waterFlowCallback/waterFlowStart1.test';
import waterFlowStart2 from './waterFlowCallback/waterFlowStart2.test';
import waterFlowFling1 from './waterFlowCallback/waterFlowFling1.test';
import waterFlowFling2 from './waterFlowCallback/waterFlowFling2.test';
import WaterFlowFlingCallback from './waterFlowCallback/WaterFlowFlingCallback.test';
import WaterFlowScrollEdgeCallbackJsunit from './waterFlowCallback/WaterFlowScrollEdgeCallback.test';
import waterFlowViewJsunit from './WaterFlow/WaterFlowView.test';
import SectionsFalse from './sectionOptions/SectionsFalse.test';
import SectionsTrue from './sectionOptions/SectionsTrue.test'
import waterFlowFad from './WaterFlow/waterFlowFad.test';
import waterFlowAniTrue from './waterFlowCallback/waterFlowAniTrue.test';
import clipContent from './WaterFlow/clipContent.test';
import cachedShowFlow from './WaterFlow/cachedShowFlow.test';
import WaterFlowBackToTopTest from './WaterFlow/WaterFlowBackToTop.test'
import WaterFlowEffectEdge from './WaterFlow/WaterFlowEffectEdge.test'
import WaterComponentContent from './WaterFlow/WaterComponentContent.test'
import setWaterFlowEvent from './waterFlowCallback/setWaterFlowEvent.test';
import barMarginFlow from './WaterFlow/barMarginFlow.test';

export default function testsuite() {
  ScrollToIndexForWaterFlowJsunit01();
  ScrollToIndexForWaterFlowJsunit02();
  waterFlowLayoutMode()
  waterFlow1Jsunit()
  waterFlow2Jsunit()
  waterFlow3Jsunit()
  waterFlow4Jsunit();
  waterFlow5Jsunit();
  waterFlow6Jsunit();
  WaterFlowSectionDemo02Jsunit()
  WaterFlowSectionDemo03Jsunit()
  WaterFlowSectionDemo04Jsunit()
  WaterFlowSectionDemo05Jsunit()
  WaterFlowSectionDemo06Jsunit()
  WaterFlowSectionDemo09Jsunit()
  WaterFlowSectionDemo11Jsunit()
  WaterFlowSectionDemo12Jsunit()
  WaterFlowSectionDemo13Jsunit()
  WaterFlowSectionDemo14Jsunit()
  WaterFlowSectionDemo16Jsunit()
  WaterFlowSectionDemo17Jsunit()
  WaterFlowSectionDemo20Jsunit()
  WaterFlowSectionDemo23Jsunit()
  WaterFlowSectionDemo25Jsunit()
  WaterFlowSectionDemo26Jsunit()
  WaterFlowSectionDemo27Jsunit()
  WaterFlowSectionDemo28Jsunit()
  WaterFlowSectionDemo30Jsunit()
  WaterFlowSectionDemo31Jsunit()
  WaterFlowSectionDemo32Jsunit()
  WaterFlowSectionDemo33Jsunit()
  WaterFlowSectionDemo35Jsunit()
  WaterFlowSectionDemo37Jsunit()
  WaterFlowSectionDemo42Jsunit()
  WaterFlowSectionDemo43Jsunit()
  WaterFlowSectionDemo45Jsunit()
  onScrollIndexFlow1()
  onScrollIndexFlow2()
  onScrollIndexFlow3()
  repeatWaterFlow()
  waterFlowScroll()
  waterFlowStart1()
  waterFlowStart2()
  waterFlowFling1()
  waterFlowFling2()
  WaterFlowFlingCallback()
  WaterFlowScrollEdgeCallbackJsunit()
  waterFlowViewJsunit();
  SectionsFalse()
  SectionsTrue()
  waterFlowFad()
  waterFlowAniTrue();
  clipContent();
  cachedShowFlow();
  WaterFlowBackToTopTest();
  WaterFlowEffectEdge()
  WaterComponentContent();
  setWaterFlowEvent()
  barMarginFlow()
}