'use static';
/*
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

import Utils, { BasePageConfig, PageConfig, TestValue } from '../../../ets/MainAbility/common/Utils';
import { expect, it, Level, Size, TestType } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {Length} from '@ohos.arkui.component'
export type CallbackWithReturn = (data: BasePageConfig) => Promise<void>;

export default class CommonTest {
  /**
   * init test
   * @param pageConfig   : page config
   * @param supportView  : support view
   * @param testValues   : test values
   * @param functions    : [0]:executeTest, [last] checkTestResult
   */
  static initTest(pageConfig: PageConfig, supportView: string[], testValues: TestValue[], ...functions: (CallbackWithReturn | CallbackWithReturn[])[]) {
    supportView.forEach(targetView => {

      //Obtain the last index of cases that need to be executed.
      let lastIndex: Int= 0;
      testValues.forEach((temp: TestValue, index: Int) => {
        if (temp.exceptView.indexOf(targetView) < 0) {
          lastIndex = index;
        }
      });

      testValues.forEach((testValue: TestValue, index: Int) => {

        //If there are components that need to be excluded, do not generate cases.
        if (testValue.exceptView.indexOf(targetView) < 0) {
          let currentIndex = index;
          let sharePage = true;
          if (pageConfig.sharePage != undefined) {
            sharePage = pageConfig.sharePage!;
          }

          //Create case name.
          let caseTag = pageConfig.testName + targetView+'_static_' + testValue.describe;

          //If there is a specified container view.
          let containerView = '';
          if (pageConfig.containerView != undefined) {
            containerView = pageConfig.containerView!;
            caseTag = pageConfig.testName + containerView + targetView + testValue.describe;
          }

          
          it(caseTag, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info('[' + caseTag + '] START');
            //Push page.
            console.info('[' + caseTag + ']' + ' test start, push page.');
            pageConfig.targetView = targetView;
            pageConfig.componentKey = targetView;
            pageConfig.containerView = containerView;
            pageConfig.testValue = testValue;
            await Utils.pushPage(pageConfig);
            try {
              //If there is no call back functions, do nothing.
              if (functions.length === 0) {
                done();
              }
              let funcs: CallbackWithReturn[] = [];
              if (functions[0] instanceof Array) {
                funcs = functions[0] as CallbackWithReturn[];
                if (funcs.length === 0) {
                  done();
                }
              }

              //Execute test
              let data: BasePageConfig = {
                pageConfig: pageConfig,
                caseTag: caseTag,
                testValue: testValue,
              }
              if (funcs.length > 1) {
                let customParams = await (functions[0] as CallbackWithReturn)(data) ?? '';
                //Set custom params to data, can be used by check test result.
                if (customParams) {
                  data.customParams = customParams;
                }
              } else {
                //If there is only an assertion function, automatically modify the status value
                AppStorage.setOrCreate<Length>('_width', data.testValue.setValue.width) // 页面不更新
                console.info('[' + caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
                await Utils.sleep(1000);
              }

              //Check test result
              console.info('[' + caseTag + '] ================== pageConfig.componentKey: ' + pageConfig.componentKey);
              let strJson = inspector.getInspectorByKey(pageConfig.componentKey ?? '');
              console.info('[' + caseTag + '] ================== strJson: ' + strJson);
              data.viewObj = JSON.parseJsonElement(strJson);
              await (functions[functions.length - 1] as CallbackWithReturn)(data);

            } catch (err: Error) {
              let msg = 'CommonTest.initTest execute ' + caseTag + ' error:' + err
              console.error(msg);
              // console.error(err.stack);
              // if (err.name != 'AssertException') {
              //   await CommonTest.back(caseTag, sharePage, currentIndex, lastIndex);
              //   expect(msg).assertTrue();
              // }
            }

            await CommonTest.back(caseTag, sharePage, currentIndex, lastIndex);

            console.info('[' + caseTag + '] END');
            done();
          });
        }
      })
    });
  }

  static async back(caseTag: string, sharePage: boolean, currentIndex: number, lastIndex: number) {
    if (sharePage) {
      if (currentIndex == lastIndex) {
        console.info('[' + caseTag + ']' + ' last case, close page.');
        await Utils.back();
      } else {
        console.info('[' + caseTag + ']' + ' share page.');
        await Utils.sleep(1000);
        await Utils.back();
      }
    } else {
      console.info('[' + caseTag + ']' + ' close page.');
      await Utils.back();
    }
  }

  static initTestByContainerView(pageConfig: PageConfig, containerView: string[], supportView: string[], testValues: TestValue[], ...functions: (CallbackWithReturn | CallbackWithReturn[])[]) {
    containerView.forEach(container => {
      pageConfig.containerView = container;
CommonTest.initTest(pageConfig, supportView, testValues, ...functions);
    });
  }
}