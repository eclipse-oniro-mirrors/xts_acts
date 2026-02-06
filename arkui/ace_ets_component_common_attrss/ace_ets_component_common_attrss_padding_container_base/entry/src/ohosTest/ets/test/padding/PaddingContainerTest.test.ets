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
import Utils from '../../MainAbility/common/Utils';
import { AttrsManager } from '../../MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentBackGroundColor: Color = Color.White;
  parentComponentKey: string = '';
  referenceComponentKey: string = '';
}

class TestValues {
  describe: string = '';
  setValue?: Padding;
  expectValue?: Padding;
}

class Padding {
  padding: ESObject;
  top?: number;
  bottom?: number;
  left?: number;
  right?: number;
}

export default function paddingTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Badge',
    'Column',
    //    'Counter',
    'GridRow',
    'Grid',
    'List',
    //    'Panel',
    'Refresh',
    'Row',
    'Scroll',
    //    'SideBarContainer',
    'Stack',
    'Swiper',
    //    'Tabs',
    'TabContent',
    'Flex',
    'GridCol',
    'GridItem',
    'ListItemGroup',
    'Navigator',
    //    'RelativeContainer',
  //    'ListItem'
  ]

  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPaddingContainer',
    pageName: 'PaddingContainerPage',
    pageUrl: 'MainAbility/pages/padding/PaddingContainerPage',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValues[] = [
    {
      describe: 'SetPadding',
      setValue: {
        padding: {
          top: 20,
          right: 10,
          bottom: 10,
          left: 10
        }
      },
      expectValue: {
        padding: {
          top: '20.00vp', right: '10.00vp', bottom: '10.00vp', left: '10.00vp'
        },
        top: vp2px(20),
        right: vp2px(10),
        bottom: vp2px(10),
        left: vp2px(10)
      }
    }, {
    describe: 'SetPaddingTop',
    setValue: {
      padding: {
        top: 20
      }
    },
    expectValue: {
      padding: {
        top: '20.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp'
      },
      top: vp2px(20),
      right: vp2px(0),
      bottom: vp2px(0),
      left: vp2px(0)
    }
  }, {
    describe: 'SetPaddingRight',
    setValue: {
      padding: {
        right: 20
      }
    },
    expectValue: {
      padding: {
        top: '0.00vp', right: '20.00vp', bottom: '0.00vp', left: '0.00vp'
      },
      top: vp2px(0),
      right: vp2px(20),
      bottom: vp2px(0),
      left: vp2px(0)
    }
  }, {
    describe: 'SetPaddingBottom',
    setValue: {
      padding: {
        bottom: 20
      }
    },
    expectValue: {
      padding: {
        top: '0.00vp', right: '0.00vp', bottom: '20.00vp', left: '0.00vp'
      },
      top: vp2px(0),
      right: vp2px(0),
      bottom: vp2px(20),
      left: vp2px(0)
    }
  }, {
    describe: 'SetPaddingLeft',
    setValue: {
      padding: {
        left: 20
      }
    },
    expectValue: {
      padding: {
        top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '20.00vp'
      },
      top: vp2px(0),
      right: vp2px(0),
      bottom: vp2px(0),
      left: vp2px(20)
    }
  }]

  /**
   * Create test suite.
   */
  describe('PaddingContainerTest', () => {
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, null, async (data: ESObject) => {
      //Modify the reference component properties.
      AttrsManager.change(data.caseTag, {
        padding: {
          left: 0, right: 0, top: 0, bottom: 0
        } as ESObject
      });
      await Utils.sleep(1000);

      //Obtain dimensional information for reference components.
      let targetRectBefore: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verify the width size of the reference component.
      let targetRectBeforeWidth = targetRectBefore.right - targetRectBefore.left;

      //Verify the height size of the reference component.
      let targetRectBeforeHeight = targetRectBefore.bottom - targetRectBefore.top;

      //Modify the target component properties.
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain dimensional information for target components.
      let targetRectAfter: ESObject = Utils.getComponentRect(data.pageConfig.componentKey);

      //Confirm that the size attribute values have been successfully set.
      let viewObj: ESObject = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(viewObj.$attrs.padding).assertEqual(JSON.stringify(data.testValue.expectValue.padding));

      //Verification method for special reference components
      if (data.pageConfig.componentKey == 'RelativeContainer' || data.pageConfig.componentKey == 'RowSplit'
        || data.pageConfig.componentKey == 'ListItemGroup' || data.pageConfig.componentKey == 'List'
        || data.pageConfig.componentKey == 'ColumnSplit' || data.pageConfig.componentKey == 'Flex'
        || data.pageConfig.componentKey == 'GridCol' || data.pageConfig.componentKey == 'FlowItem'
        || data.pageConfig.componentKey == 'GridRow' || data.pageConfig.componentKey == 'Panel'
        || data.pageConfig.componentKey == 'SideBarContainer' || data.pageConfig.componentKey == 'TabContent'
        || data.pageConfig.componentKey == 'WaterFlow') {
        //Obtain the size information of the reference component.
        let referenceRect: ESObject = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

        console.info('[' + data.caseTag + '] referenceRect.top - targetRectAfter.top:'
          + (referenceRect.top - targetRectAfter.top));
        console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
          + (targetRectAfter.bottom - referenceRect.bottom));
        console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
          + (targetRectAfter.right - referenceRect.right));
        console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
          + (referenceRect.left - targetRectAfter.left));

        //Verification method for special reference components.
        if (data.testValue.describe == 'SetPadding') {
          //Panel component need special adapter ,the reason is the top of Panel has a own size
          if (data.pageConfig.componentKey == 'Panel') {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.top + vp2px(8))) <= 1)
              .assertTrue();
          } else {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - data.testValue.expectValue.top) <= 1)
              .assertTrue();
          }
          expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.bottom) <= 1)
            .assertTrue();
          expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.right) <= 1)
            .assertTrue();
          expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.left) <= 1)
            .assertTrue();
        } else if (data.testValue.describe == 'SetPaddingTop') {
          //Panel component need special adapter ,the reason is the top of Panel has a own size
          if (data.pageConfig.componentKey == 'Panel') {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.top + vp2px(8))) <= 1)
              .assertTrue();
          } else {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.top)) <= 1)
              .assertTrue();
          }
        } else if (data.testValue.describe == 'SetPaddingBottom') {
          expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.bottom) <= 1)
            .assertTrue();
        } else if (data.testValue.describe == 'SetPaddingRight') {
          expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.right) <= 1)
            .assertTrue();
        } else if (data.testValue.describe == 'SetPaddingLeft') {
          expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.left) <= 1)
            .assertTrue();
        }
      } else if (data.pageConfig.componentKey == 'Tabs') {
        let referenceRect: ESObject = Utils.getComponentRectByObj(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[1]);
        let rectTabBar: ESObject = Utils.getComponentRectByObj(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]);
        if (data.testValue.describe == 'SetPadding') {
          expect(Math.abs(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top) - data.testValue.expectValue.top) <= 1)
            .assertTrue();
          expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.bottom) <= 1)
            .assertTrue();
          expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.right) <= 1)
            .assertTrue();
          expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.left) <= 1)
            .assertTrue();
        } else if (data.testValue.describe == 'SetPaddingTop') {
          expect(Math.abs(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top) - data.testValue.expectValue.top) <= 1)
            .assertTrue();
        } else if (data.testValue.describe == 'SetPaddingBottom') {
          expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.bottom) <= 1)
            .assertTrue();
        } else if (data.testValue.describe == 'SetPaddingRight') {
          expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.right) <= 1)
            .assertTrue();
        } else if (data.testValue.describe == 'SetPaddingLeft') {
          expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.left) <= 1)
            .assertTrue();
        }
      } else {
        //Verify the width size of the target component.
        let targetRectAfterWidth = targetRectAfter.right - targetRectAfter.left;

        //Verify the height size of the target component.
        let targetRectAfterHeight = targetRectAfter.bottom - targetRectAfter.top;

        console.info('[' + data.caseTag + '] targetRectBeforeWidth:' + targetRectBeforeWidth);
        console.info('[' + data.caseTag + '] targetRectBeforeHeight:' + targetRectBeforeHeight);
        console.info('[' + data.caseTag + '] referenceRectAfterWidth:' + targetRectAfterWidth);
        console.info('[' + data.caseTag + '] referenceRectAfterHeight:' + targetRectAfterHeight);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.left:' + data.testValue.expectValue.left);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.right:' + data.testValue.expectValue.right);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.top:' + data.testValue.expectValue.top);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.bottom:' + data.testValue.expectValue.bottom);

        //Confirm that the calculated value is consistent with the expected value.
        expect(Math.floor(Math.abs(targetRectAfterWidth - targetRectBeforeWidth - (data.testValue.expectValue.left + data.testValue.expectValue.right))) <= 1)
          .assertTrue();
        expect(Math.floor(Math.abs(targetRectAfterHeight - targetRectBeforeHeight - (data.testValue.expectValue.top + data.testValue.expectValue.bottom))) <= 1)
          .assertTrue();
      }
    })
  })
}