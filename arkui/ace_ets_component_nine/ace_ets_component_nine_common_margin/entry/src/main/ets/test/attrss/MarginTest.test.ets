/*
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

import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'
import Utils from '../../MainAbility/common/Utils';

export default function marginTest() {
  let supportView = [
  //'AlphabetIndexer',
    'Button',
    'Blank',
    // 'Checkbox',
    //'CheckboxGroup',
    //'DataPanel',
    //'DatePicker',
    'Divider',
    //'Gauge',
    'Image',
    //'ImageAnimator',
    //'LoadingProgress',
    //'Marquee',
    //'Menu',
    //'MenuItem',
    //'MenuItemGroup',
    ////'Navigation',
    //'NavRouter',
    //'Progress',
    //'QRCode',
    //'Radio',
    //'Rating',
    //'ScrollBar',
    //'Search',
    //'Select',
    //'Slider',
    //'Stepper',
    'Text',
    //'TextArea',
    //'TextClock',
    //'TextInput',
    //'TextPicker',
    //'TextTimer',
    //'TimePicker',
    //'Toggle',
    //'Badge',
    //'Column',
    //'ColumnSplit',
    //'Counter',
    //'Flex',
    ////'FlowItem',
    'GridCol',
  //'GridRow',
  //'Grid',
  //'GridItem',
  //'List',
  //'ListItem',
  //'ListItemGroup',
  //'Navigator',
  //'Panel',
  //'Refresh',
  //'RelativeContainer',
  //'Row',
  //'RowSplit',
  //'Scroll',
  //'SideBarContainer',
  //'Stack',
  //'Swiper',
  //'Tabs',
  //'Circle',
  //'Ellipse',
  //'Polyline',
  //'Polygon',
  //'Path',
  //'Rect',
  //'Shape',
  //'Line',
  //'WaterFlow'
  ]
  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let pageConfig: Record<string, string | number> = {
    'testName': 'testMargin',
    'pageName': 'MarginPage',
    'pageUrl': 'MainAbility/pages/common/MarginPage',
    'targetComponentHeight': targetComponentHeight,
    'targetComponentWidth': targetComponentWidth,
    'referenceComponentKey': 'referenceComponentKey',
    'parentComponentKey': 'parentComponentKey'
  }

  let testValues: Array<Record<string, ESObject>> = [{
    'describe': 'SetMargin60',
    'setValue': '60cp',
    'expectValue': {
      margin: '60.00vp'
    }
  }, {
    'describe': 'SetMarginObject',
    'setValue': {
      left: 10, right: 50, top: 80, bottom: 40
    },
    'expectValue': {
      margin: '{"top":"80.00vp","right":"50.00vp","bottom":"40.00vp","left":"10.00vp"}'
    }
  }]
  /**
   * @tc.number Common_Margin_10010
   * @tc.name testCommonMarginStringAndObject
   * @tc.desc The Margin property of the Common component is set to StringAndObject
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level 0
   */
  describe('MarginTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      AttrsManager.change(data.caseTag, 0);
      await Utils.sleep(1000);
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + ']' + 'expectValue margin is:' + data.testValue.expectValue.margin);
      console.info('[' + data.caseTag + ']' + 'margin is:' + viewObj.$attrs.margin);
      expect(viewObj.$attrs.margin).assertEqual(data.testValue.expectValue.margin);
    });
  })
}