/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import pasteboard from '@ohos.pasteboard'
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import { abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let TAG = "PASTEBOARDSNDK--------------------"
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_PASTEBOARD'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms:number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = Driver.create();
    console.info('come in driveFn');
    console.info('driver is ${JSON.stringify(driver)}');
    await sleep(1000);
    let button = await driver.findComponent(ON.text('始终允许'));
    if (button) {
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button.click();
      await  sleep(1000);
    } else {
      let button1 = await driver.findComponent(ON.text('仅本次允许'));
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button1.click();
      await  sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
    return
  }
}
/**
 *  The callback function is used for pasteboard content changes
 */
function contentChanges() {
  console.info('#EVENT: The content is changed in the pasteboard')
}

export default function pasteBoardJEtsunitTest() {
  console.info('beforeAll PasteBoardTest start');
  describe('pasteBoardJEtsunitTest', () => {
    console.info('beforeAll PasteBoardTest start2');
    beforeAll(async (done:Function) => {
      console.info('start################################start');
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })
    
    /**
     * @tc.name   pasteboard_function_test1
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1500
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_0100 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test1: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test1: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            let types: Array<String> = pasteData.getMimeTypes();
            expect(types.length == 1).assertTrue();
            expect(types).assertDeepEquals(["text/plain"]);
            console.info('f_test1: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              let primaryText = pasteData1.getPrimaryText();
              expect(primaryText == textData).assertTrue;
              expect(pasteboard.MAX_RECORD_NUM == 512).assertTrue();
              console.info('Checks PasteDataProperty.localOnly');
              let pasteDataProperty = pasteData1.getProperty();
              console.info('Checks: localOnly = ' + pasteDataProperty.localOnly);
              expect(pasteData1.getPrimaryMimeType()).assertEqual(pasteboard.MIMETYPE_TEXT_PLAIN);

              console.info('f_test1: SUB_pasteBoard_function_JS_API_0100 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test2
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1400
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('f_test2: SUB_pasteBoard_function_JS_API_0200 start');
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = '';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test2: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test2: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test2: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              let PrimaryText = pasteData1.getPrimaryText();
              expect(PrimaryText == textData).assertTrue;
              let recordCount = pasteData1.getRecordCount();
              expect(recordCount == 1).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_0200 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test3
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('f_test3: SUB_pasteBoard_function_JS_API_0300 start');
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello 中国!@#$%^&*()_+{}\?.';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test3: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test3: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test3: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('f_test3: Checks the pasteboard content');
              let primaryText = pasteData1.getPrimaryText();
              expect(primaryText == textData).assertTrue;
              let hastypes: boolean = pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_PLAIN);
              expect(hastypes).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_0300 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test4
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1600
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_0400 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = '';
        for (let i = 0; i < 300; i++) {
          textData = textData + "A";
        };
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test4: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test4: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test4: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('f_test4: Checks the pasteboard content');
              let primaryText = pasteData1.getPrimaryText();
              expect(primaryText == textData).assertTrue;
              let hastypes: boolean = pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_PLAIN);
              expect(hastypes).assertTrue();
              expect(pasteData1.getPrimaryMimeType() == pasteboard.MIMETYPE_TEXT_PLAIN).assertTrue();
              console.info('f_test4: SUB_pasteBoard_function_JS_API_0400 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test5
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1700
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_0500 start');
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = '';
        for (let i = 0; i < 301; i++) {
          textData = textData + "A";
        };
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test5: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test5: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test5: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('f_test5: Checks the pasteboard content');
              let primaryText = pasteData1.getPrimaryText();
              expect(primaryText == textData).assertTrue;
              let hastypes: boolean = pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_PLAIN);
              expect(hastypes).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_0500 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test6
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0700
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_0600 start');
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test6: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test6: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test6: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('f_test6: Checks the pasteboard content');
              let primaryHtml = pasteData1.getPrimaryHtml();
              expect(primaryHtml == htmlText).assertTrue();
              let hastypes: boolean = pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_HTML);
              expect(hastypes).assertTrue();
              expect(pasteData1.getPrimaryMimeType()).assertEqual(pasteboard.MIMETYPE_TEXT_HTML);

              console.info('SUB_pasteBoard_function_JS_API_0600 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test7
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0600
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('f_test7: SUB_pasteBoard_function_JS_API_0700 start');
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let htmlText = '';
        let pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test7: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test7: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test7: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              let primaryHtml = pasteData1.getPrimaryHtml();
              expect(primaryHtml == htmlText).assertTrue();
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_0700 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test8
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_0800 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let htmlText = 'Hello 中国!@#$%^&*()_+{}\?.';
        let pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test8: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test8: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test8: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getPrimaryHtml() == htmlText).assertTrue();
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              let hastypes: boolean = pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_HTML);
              expect(hastypes).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_0800 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test9
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0900
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_0900 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createUriData(uriText);
        console.info('f_test9: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test9: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test9: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('f_test9: Checks the pasteboard content');
              let primaryUri = pasteData1.getPrimaryUri();
              expect(primaryUri == uriText).assertTrue();
              let hastypes: boolean = pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_URI);
              expect(hastypes).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_0900 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test10
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0800
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1000 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let uriText = '';
        let pasteData = pasteboard.createUriData(uriText);
        console.info('f_test10: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test10: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test10: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getPrimaryUri() == uriText).assertTrue();
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_1000 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test11
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1100 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let uriText = 'Hello//';
        let pasteData = pasteboard.createUriData(uriText);
        console.info('f_test11: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test11: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test11: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getPrimaryUri() == uriText).assertTrue();
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              let hastypes: boolean = pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_URI);
              expect(hastypes).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_1100 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test12
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1000
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1200 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let want: Want = {
          bundleName: "com.example.myapplication8",
          abilityName: "com.example.myapplication8.MainAbility"
        };
        let pasteData = pasteboard.createWantData(want);
        console.info('f_test12: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test12: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test12: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('f_test12: Checks the pasteboard content');
              let primaryWant = pasteData1.getPrimaryWant();
              expect(want.bundleName).assertEqual(primaryWant.bundleName);
              expect(want.abilityName).assertEqual(primaryWant.abilityName);
              let hastypes: boolean = pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_WANT);
              expect(hastypes).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_1200 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test13
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1300 start')
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test13: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test13: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('f_test13: Checks the pasteboard content');
              let recordText = pasteData1.getRecordAt(0).plainText
              console.info('f_test13: recordText = ' + recordText);
              expect(recordText).assertEqual(textData);

              console.info('SUB_pasteBoard_function_JS_API_1300 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test14
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1400 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);
        let textData1 = 'Hello World1';
        pasteData.addTextRecord(textData1)
        console.info('f_test14: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test14: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test14: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 2).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_1400 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test15
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1500 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);
        let textData = '';
        for (let i = 1; i < 15; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData)
        }

        console.info('f_test15: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test15: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test15: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 15).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_1500 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test16
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0400
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1600 start')
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);
        let textData = '';
        for (let i = 1; i < 30; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData)
        }

        console.info('f_test16: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test16: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test16: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 30).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_1600 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test17
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_0500
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1700 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);
        let textData = '';
        for (let i = 1; i < 31; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData)
        }

        console.info('f_test17: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test17: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test17: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              let recordCount = pasteData1.getRecordCount()
              expect(pasteData1.getRecordCount() == 31).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_1700 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test18
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataAddRead_1800
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1800 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        pasteData.addHtmlRecord(htmlText)

        let uriText = 'https://www.baidu.com/';
        pasteData.addUriRecord(uriText)

        let want: Want = {
          bundleName: "com.example.myapplication8",
          abilityName: "com.example.myapplication8.MainAbility"
        };
        pasteData.addWantRecord(want);


        console.info('f_test18: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test18: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test18: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 4).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_1800 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test19
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_1900 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test19: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test19: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test19: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test19: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('f_test19: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test19: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  let pasteData2 = data;
                  let recordCount = pasteData2.getRecordCount();
                  expect(recordCount).assertEqual(0);

                  console.info('SUB_pasteBoard_function_JS_API_1900 end');
                  done();

                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test20
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0800
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2000 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test20: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test20: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test20: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test20: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('f_test20: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test20: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  let pasteData2 = data;
                  let recordCount = pasteData2.getRecordCount();
                  expect(recordCount).assertEqual(0);

                  console.info('SUB_pasteBoard_function_JS_API_2000 end');
                  done();

                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test21
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0900
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2100 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createUriData(uriText);
        console.info('f_test21: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test21: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test21: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test21: f_test21: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();
              console.info('f_test21: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test21: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  let pasteData2 = data;
                  let recordCount = pasteData2.getRecordCount();
                  expect(recordCount).assertEqual(0);

                  console.info('SUB_pasteBoard_function_JS_API_2100 end');
                  done();

                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test22
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1000
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2200 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let want: Want = {
          bundleName: "com.example.myapplication8",
          abilityName: "com.example.myapplication8.MainAbility"
        }
        let pasteData = pasteboard.createWantData(want);
        console.info('f_test22: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test22: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test22: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test22: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('f_test22: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test22: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  let pasteData2 = data;
                  let recordCount = pasteData2.getRecordCount();
                  expect(recordCount).assertEqual(0);

                  console.info('SUB_pasteBoard_function_JS_API_2200 end');
                  done();

                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test23
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_0700
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2300 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = ''
        for (let i = 0; i < 300; i++) {
          textData = textData + "A";
        }
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test23: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test23: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test23: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test23: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('f_test23: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test23: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  let pasteData2 = data;
                  let recordCount = pasteData2.getRecordCount();
                  expect(recordCount).assertEqual(0);
                  console.info('SUB_pasteBoard_function_JS_API_2300 end');
                  done();

                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test24
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_2100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2400 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World';
        let pasteData = pasteboard.createPlainTextData(textData0);

        let textData = '';
        for (let i = 1; i < 30; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData);
        }

        systemPasteboard.setPasteData(pasteData).then(() => {

          console.info('f_test24: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 30).assertTrue();

              console.info('f_test24: Removes the Record')
              for (let i = 0; i < 30; i++) {
                let removeat: boolean = pasteData1.removeRecordAt(29-i);
                expect(removeat).assertTrue();
              }

              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test24: systemPasteboard.setPasteData promise');
                systemPasteboard.getPasteData().then((data) => {
                  let pasteData2 = data;
                  let recordCount = pasteData2.getRecordCount();
                  expect(recordCount).assertEqual(0);

                  console.info('SUB_pasteBoard_function_JS_API_2400 end');
                  done();

                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test25
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2500 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test25: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test25: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test25: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              let textData1 = 'Hello World1';
              let pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
              let replace: boolean = pasteData1.replaceRecordAt(0, pasteDataRecord);
              expect(replace).assertTrue();

              console.info('f_test25: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('f_test25: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test25: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  let pasteData2 = data;
                  let recordCount = pasteData2.getRecordCount();
                  expect(recordCount).assertEqual(0);

                  console.info('SUB_pasteBoard_function_JS_API_2500 end');
                  done();

                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test26
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_2200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2600 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        pasteData.addHtmlRecord(htmlText);

        let uriText = 'https://www.baidu.com/';
        pasteData.addUriRecord(uriText)

        console.info('f_test26: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test26: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test26: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 3).assertTrue();

              console.info('f_test26: Removes the Record');
              let removeat: boolean = pasteData1.removeRecordAt(2);
              expect(removeat).assertTrue();
              let removeat1: boolean = pasteData1.removeRecordAt(1);
              expect(removeat1).assertTrue();
              let removeat2: boolean = pasteData1.removeRecordAt(0);
              expect(removeat2).assertTrue();

              console.info('f_test26: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test26: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  let pasteData2 = data;
                  let recordCount = pasteData2.getRecordCount();
                  expect(recordCount).assertEqual(0);

                  console.info('SUB_pasteBoard_function_JS_API_2600 end');
                  done();

                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test27
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1800
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2700 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test27: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test27: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test27: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              let textData1 = 'Hello World1';
              let pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
              let replace: boolean = pasteData1.replaceRecordAt(0, pasteDataRecord);
              expect(replace).assertTrue();

              console.info('f_test27: Checks the pasteboard content');
              let primaryText = pasteData1.getPrimaryText();
              expect(primaryText).assertEqual(textData1);

              console.info('SUB_pasteBoard_function_JS_API_2700 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test28
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1500
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2800 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData = pasteboard.createHtmlData(htmlText);

        console.info('f_test28: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test28: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test28: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              let htmlText1 = '<html><head></head><body>Hello World 1</body></html>';
              let pasteDataRecord = pasteboard.createHtmlTextRecord(htmlText1)
              let replace: boolean = pasteData1.replaceRecordAt(0, pasteDataRecord);
              expect(replace).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_2800 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test29
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1600
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_2900 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createUriData(uriText);

        console.info('f_test29: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test29: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test29: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              let uriText1 = 'https://www.baidu.com/1';
              let pasteDataRecord = pasteboard.createUriRecord(uriText1);
              let replace: boolean = pasteData1.replaceRecordAt(0, pasteDataRecord);
              expect(replace).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_2900 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test30
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1700
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3000 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let wantText0: Want = {
          bundleName: "com.example.myapplication3",
          abilityName: "com.example.myapplication3.MainAbility"
        };
        let pasteData = pasteboard.createWantData(wantText0);

        console.info('f_test30: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test30: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test30: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              let wantText1: Want = {
                bundleName: "com.example.myapplication30",
                abilityName: "com.example.myapplication30.MainAbility"
              };
              let pasteDataRecord = pasteboard.createWantRecord(wantText1);
              let replace: boolean = pasteData1.replaceRecordAt(0, pasteDataRecord);
              expect(replace).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_3000 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test31
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataRemoveOrReplace_1400
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3100 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = ''
        for (let i = 0; i < 300; i++) {
          textData = textData + "A";
        }
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test31: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test31: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test31: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              let textData1 = 'Hello World1';
              let pasteDataRecord = pasteboard.createPlainTextRecord(textData1);
              let replace: boolean = pasteData1.replaceRecordAt(0, pasteDataRecord);
              expect(replace).assertTrue();
              let primaryText = pasteData1.getPrimaryText();
              expect(primaryText).assertEqual(textData1);

              console.info('SUB_pasteBoard_function_JS_API_3100 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test32
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataQuery_0200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3200 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test32: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test32: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_3200 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test33
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataQuery_0300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3300 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);

        let textData = ''
        for (let i = 1; i < 2; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData);
        }
        console.info('f_test33: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test33: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test33: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 2).assertTrue();

              console.info('SUB_pasteBoard_function_.' + 'JS_API_3300 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test34
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataQuery_0100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3400 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);

        let textData = ''
        for (let i = 1; i < 15; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData);
        }

        console.info('f_test34: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test34: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test34: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 15).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_3400 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test35
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataQuery_0400
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3500 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);

        let textData = ''
        for (let i = 1; i < 30; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData);
        }

        console.info('f_test35: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test35: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test35: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 30).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_3500 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test36
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataQuery_0700
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3600 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);

        let textData = '';
        for (let i = 1; i < 31; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData);
        }

        console.info('f_test36: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test36: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test36: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 31).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_3600 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test37
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataQuery_0500
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3700 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test37: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test37: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test37: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              let textData1 = 'Hello World1';
              let pasteDataRecord = pasteboard.createPlainTextRecord(textData1);
              let replace: boolean = pasteData1.replaceRecordAt(0, pasteDataRecord);
              expect(replace).assertTrue();

              console.info('f_test37: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                let pasteData2 = data;
                expect(pasteData2.getRecordCount() == 1).assertTrue();

                console.info('SUB_pasteBoard_function_JS_API_3700 end');
                done();
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test38
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataQuery_0600
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3800 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test38: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test38: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test38: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test38: Clears the pasteBoard')
              systemPasteboard.clearDataSync();

              console.info('f_test38: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                let pasteData2 = data;
                let recordCount = pasteData2.getRecordCount();
                expect(recordCount).assertEqual(0);

                console.info('SUB_pasteBoard_function_JS_API_3800 end');
                done();
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test39
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_3900 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test39: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test39: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test39: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test39: Sets the Property')
              let pasteDataProperty = pasteData1.getProperty();
              let object: ESObject = {
                bundleName: "pasteBoardJEtsunitTest"
              };
              pasteDataProperty.additions["one"] = object;
              pasteDataProperty.shareOption = 1;
              pasteData1.setProperty(pasteDataProperty);

              console.info('f_test39: Checks the Property')
              systemPasteboard.setPasteData(pasteData1).then(() => {
                systemPasteboard.hasPasteData().then((data: boolean) => {
                  expect(data == true).assertTrue();
                  systemPasteboard.getPasteData().then((data) => {
                    let pasteData2 = data;
                    let pasteDataProperty1 = pasteData2.getProperty();
                    expect(pasteDataProperty1.shareOption == 1).assertTrue();
                    console.info('f_test39: timestamp = ' + pasteDataProperty1.timestamp);
                    let tag1 = pasteData1.getTag();
                    console.info('f_test39: gettag = ' + tag1);
                    console.info('f_test39: additions = ' + pasteDataProperty1.additions["one"])
                    console.info('SUB_pasteBoard_function_JS_API_3900 end');
                    done();
                  });
                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test40
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4000 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test40: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test40: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test40: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test40: Sets the Property');
              let pasteDataProperty = pasteData1.getProperty();
              console.info('f_test40: timestamp = ' + pasteDataProperty.timestamp);
              pasteDataProperty.tag = "Test";
              pasteData1.setProperty(pasteDataProperty);

              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('Succeeded in setting PasteData.');
                systemPasteboard.hasPasteData().then((data: boolean) => {
                  console.info(`Succeeded in checking the PasteData. Data: ${data}`);
                  expect(data == true).assertTrue();
                  systemPasteboard.getPasteData().then((data) => {
                    let pasteData2 = data;
                    let pasteDataProperty1 = pasteData2.getProperty();
                    expect(pasteDataProperty1.tag == "Test").assertTrue();
                    console.info('f_test40: timestamp = ' + pasteDataProperty1.timestamp);
                    console.info('f_test40: tag = ' + pasteDataProperty1.tag);

                    console.info('SUB_pasteBoard_function_JS_API_4000 end');
                    done();
                  }).catch((err: ESObject) => {
                    console.info("getPasteData error,error: " + err)
                  })
                });
              });
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test41
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataSetQueryProperty_0500
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4100 start');

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test41: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test41: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test41: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test41: Clears the pasteBoard');
              systemPasteboard.clearDataSync();

              console.info('f_test41: Checks the Property');
              let pasteDataProperty1 = pasteData1.getProperty();
              expect(pasteDataProperty1.tag == "").assertTrue();
              console.info('f_test41: timestamp = ' + pasteDataProperty1.timestamp);
              console.info('f_test41: tag = ' + pasteDataProperty1.tag);

              console.info('SUB_pasteBoard_function_JS_API_4100 end');
              done();
            });
          });
        });
      });
    });

    /**
     * @tc.name   pasteboard_function_test42
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0900
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4200 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test42: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test42: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test42: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test42: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test42: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4200 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test43
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0600
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4300 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test43: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData = pasteboard.createHtmlData(htmlText);

        console.info('f_test43: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {

          console.info('f_test43: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test43: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test43: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4300 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test44
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0700
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4400 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test44: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges);

        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createUriData(uriText);

        console.info('f_test44: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test44: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test44: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test44: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4400 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test45
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0800
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4500 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test45: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        let want: Want = {
          bundleName: "com.example.myapplication45",
          abilityName: "com.example.myapplication45.MainAbility"
        }
        let pasteData = pasteboard.createWantData(want);

        console.info('f_test45: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test45: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test45: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test45: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4500 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test46
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_1000
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4600 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test46: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test46: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test46: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test46: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_4600 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test47
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0400
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4700 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test47: Close the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test47: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test47: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test47: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test47: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4700 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test48
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4800 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test48: Close the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData = pasteboard.createHtmlData(htmlText);

        console.info('f_test48: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test48: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test48: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test48: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4800 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test49
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_4900 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test49: Close the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createUriData(uriText);

        console.info('f_test49: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test49: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test49: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test49: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4900 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test50
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5000 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test50: Open the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        let want: Want = {
          bundleName: "com.example.myapplication45",
          abilityName: "com.example.myapplication45.MainAbility"
        }
        let pasteData = pasteboard.createWantData(want);

        console.info('f_test50: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test50: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test50: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test50: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_5000 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test51
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ContentChangeEvent_0500
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test51', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5100 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test51: Close the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test51: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test51: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test51: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_5100 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test52
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2400
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test52', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5200 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test52: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test52: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test52: systemPasteboard.setPasteData promise');

          console.info('f_test52: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            console.info('f_test52: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data).assertTrue();

            console.info('f_test52: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test52: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test52: Clears the pasteBoard')
              systemPasteboard.clearDataSync();

              console.info('f_test52: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test52: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                let pasteData2 = data;
                let recordCount = pasteData2.getRecordCount();
                expect(recordCount).assertEqual(0);
                done();
              })
              console.info('SUB_pasteBoard_function_JS_API_5200 end');
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test53
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5300 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createUriData(uriText);

        console.info('f_test53: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test53: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test53: Clears the pasteBoard')
              systemPasteboard.clearDataSync();

              console.info('f_test53: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                let pasteData2 = data;
                let recordCount = pasteData2.getRecordCount();
                expect(recordCount).assertEqual(0);
                done();
              })
              console.info('SUB_pasteBoard_function_JS_API_5300 end');
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test54
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5400 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        console.info('f_test54: createHtmlData htmlText = ' + htmlText);
        let pasteData = pasteboard.createHtmlData(htmlText);

        console.info('f_test54: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test54: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test54: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test54: Clears the pasteBoard')
              systemPasteboard.clearDataSync();

              console.info('f_test54: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                let pasteData2 = data;
                let recordCount = pasteData2.getRecordCount();
                expect(recordCount).assertEqual(0);
                done();
              })
              console.info('SUB_pasteBoard_function_JS_API_5400 end');
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test55
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test55', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5500 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let myWant: Want = {
          bundleName: "com.example.myapplication55",
          abilityName: "com.example.myapplication55.MainAbility"
        }
        let pasteData = pasteboard.createWantData(myWant);
        console.info('f_test55: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test55: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test55: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test55: Clears the pasteBoard')
              systemPasteboard.clearDataSync();

              console.info('f_test55: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                let pasteData2 = data;
                let recordCount = pasteData2.getRecordCount();
                expect(recordCount).assertEqual(0);
                done();
              })
              console.info('SUB_pasteBoard_function_JS_API_5500 end');
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test56
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test56', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5600 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData0);

        let textData = ''
        for (let i = 1; i < 30; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData);
        }

        console.info('f_test56: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test56: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test56: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 30).assertTrue();

              console.info('f_test56: Clears the pasteBoard')
              systemPasteboard.clearDataSync();

              console.info('f_test56: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                let pasteData2 = data;
                let recordCount = pasteData2.getRecordCount();
                expect(recordCount).assertEqual(0);
                done();
              })
              console.info('SUB_pasteBoard_function_JS_API_5600 end');
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test57
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test57', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5700 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World0';
        let pasteData = pasteboard.createPlainTextData(textData0)

        let textData = '';
        for (let i = 1; i < 5; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData);
        }

        let htmlText = '';
        for (let i = 0; i < 5; i++) {
          htmlText = '<html><head></head><body>Hello World!</body></html>';
          htmlText = htmlText + i;
          pasteData.addHtmlRecord(htmlText);
        }

        let uriText = '';
        for (let i = 0; i < 5; i++) {
          uriText = 'https://www.baidu.com/';
          uriText = uriText + i;
          pasteData.addUriRecord(uriText);
        }

        systemPasteboard.setPasteData(pasteData).then(() => {
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 15).assertTrue();
              systemPasteboard.clearDataSync()
              systemPasteboard.getPasteData().then((data) => {
                let pasteData2 = data;
                let recordCount = pasteData2.getRecordCount();
                expect(recordCount).assertEqual(0);
                done();
              })
              console.info('SUB_pasteBoard_function_JS_API_5700 end');
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test58
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0900
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test58', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5800 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test58: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test58: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('SUB_pasteBoard_function_JS_API_5800 end')
            done();
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test59
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0600
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test59', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_5900 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createUriData(uriText);

        console.info('f_test59: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test59: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('SUB_pasteBoard_function_JS_API_5900 end')
            done();
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test60
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0500
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test60', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6000 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let htmlText = '<html><head></head><body>Hello World!</body></html>';
        let pasteData = pasteboard.createHtmlData(htmlText);

        console.info('f_test60Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test60Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('SUB_pasteBoard_function_JS_API_6000 end')
            done();
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test61
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0700
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test61', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6100 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let myWant: Want = {
          bundleName: "com.example.myapplication8",
          abilityName: "com.example.myapplication8.MainAbility"
        };
        let pasteData = pasteboard.createWantData(myWant);
        console.info('Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('SUB_pasteBoard_function_JS_API_6100 end')
            done();
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test62
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0400
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test62', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6200 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World0';
        let pasteData = pasteboard.createPlainTextData(textData0)

        let textData = '';
        for (let i = 1; i < 5; i++) {
          textData = 'Hello World';
          textData = textData + i;
          pasteData.addTextRecord(textData);
        }

        let htmlText = '';
        for (let i = 0; i < 5; i++) {
          htmlText = '<html><head></head><body>Hello World!</body></html>';
          htmlText = htmlText + i;
          pasteData.addHtmlRecord(htmlText);
        }

        let uriText = '';
        for (let i = 0; i < 5; i++) {
          uriText = 'https://www.baidu.com/';
          uriText = uriText + i;
          pasteData.addUriRecord(uriText)
        }

        console.info('f_test62 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test62 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('SUB_pasteBoard_function_JS_API_6200 end')
            done();
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test63
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_1200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test63', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6300 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test63 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test63 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              let textData1 = 'Hello World1';
              let pasteDataRecord = pasteboard.createPlainTextRecord(textData1);
              let replace: boolean = pasteData1.replaceRecordAt(0, pasteDataRecord);
              expect(replace).assertTrue();

              console.info('f_test63 Checks there is content in the pasteboard')
              systemPasteboard.hasPasteData().then((data: boolean) => {
                expect(data).assertTrue();
                done();
              })
              console.info('SUB_pasteBoard_function_JS_API_6300 end');
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test64
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6400 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test64 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test64 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test64 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              let recordCount = pasteData1.getRecordCount();
              expect(recordCount).assertEqual(1)

              console.info('f_test64 Removes the Record')
              pasteData1.removeRecordAt(0);
              let recordCount1 = pasteData1.getRecordCount();
              expect(recordCount1).assertEqual(0);
              console.info('SUB_pasteBoard_function_JS_API_6400 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test65
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2500
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test65', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6500 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test65 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test65 Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test65 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test65 Clears the pasteBoard')
              systemPasteboard.clearDataSync();
              console.info('f_test65 Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test65 Checks there is no content in the pasteboard')
                systemPasteboard.hasPasteData().then((data: boolean) => {
                  console.info('f_test65 systemPasteboard.hasPasteData promise data = ' + data);
                  console.info('SUB_pasteBoard_function_JS_API_6500 end');
                  done();
                });
              });
            });
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test66
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_0800
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test66', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6600 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test66 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test66 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test66 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test66 Converts the PlainTextData to text')
              let pasteDataRecord = pasteData1.getRecordAt(0)
              expect(pasteDataRecord.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_PLAIN);
              console.info('f_test66 pasteDataRecord.convertToText = ' + pasteDataRecord.convertToText);

              console.info('f_test66 SUB_pasteBoard_function_JS_API_6600 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test67
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_0600
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test67', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6700 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = 'Hello 中国!@#$%^&*()_+{}\?.';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test67 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test67 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test67 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test67 Converts the PlainTextData to text');
              let pasteDataRecord = pasteData1.getRecordAt(0);
              expect(pasteDataRecord.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_PLAIN);
              console.info('f_test67 pasteDataRecord.convertToText = ' + pasteDataRecord.convertToText);

              console.info('SUB_pasteBoard_function_JS_API_6700 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test68
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_0700
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test68', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6800 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData = ''
        for (let i = 0; i < 301; i++) {
          textData = textData + "A";
        }
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test68 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test68 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test68 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test68 Converts the PlainTextData to text')
              let pasteDataRecord = pasteData1.getRecordAt(0);
              expect(pasteDataRecord.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_PLAIN);
              console.info('f_test68 pasteDataRecord.convertToText = ' + pasteDataRecord.convertToText);

              console.info('SUB_pasteBoard_function_JS_API_6800 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test69
     * @tc.number SUB_Pasteboard_Local_SDK_PasteDataConvert_0400
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test69', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_6900 start')
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let uriText = 'https://www.baidu.com/';
        let pasteData = pasteboard.createUriData(uriText);
        console.info('f_test69 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test69 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            console.info('f_test69 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();
              console.info('f_test69 Converts the PlainTextData to text')
              let pasteDataRecord = pasteData1.getRecordAt(0)
              pasteDataRecord.convertToText().then((data) => {
                console.info('convertToText success data  ' + JSON.stringify(data));
              }).catch((error: ESObject) => {
                console.error('convertToText failed because ' + JSON.stringify(error));
              });
              console.info('SUB_pasteBoard_function_JS_API_6900 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test70
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_0800
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test70', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_7000 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        let textData0 = 'Hello World0';
        let pasteData = pasteboard.createPlainTextData(textData0);
        let uriText = pasteboard.createUriRecord("https://www.baidu.com/");
        pasteData.addRecord(uriText);
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('---------------------------->1')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              let recordCount = pasteData1.getRecordCount();
              expect(recordCount == 2).assertTrue();
              console.info('SUB_pasteBoard_function_JS_API_7000 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test71
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_onRemoteUpdate_0100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test71', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_7100 start')
      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test71: Open the infor for pasteboard content changes')
        systemPasteboard.onRemoteUpdate(contentChanges);

        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test71: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test71: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test71: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test71: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_7100 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test72
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_onRemoteUpdate_0200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test72', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_7200 start')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.onRemoteUpdate(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to on. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
        done();
      }
      console.info('SUB_pasteBoard_function_JS_API_7200 end')
    })

    /**
     * @tc.name   pasteboard_function_test73
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_offRemoteUpdate_0100
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test73', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_7300 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test73: Close the infor for pasteboard content changes')
        systemPasteboard.offRemoteUpdate(contentChanges)

        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test73: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test73: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test73: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test73: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_7300 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test74
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_offRemoteUpdate_0200
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test74', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_7400 start')

      let systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test74: Close the infor for pasteboard content changes')
        systemPasteboard.offRemoteUpdate()

        let textData = 'Hello World!';
        let pasteData = pasteboard.createPlainTextData(textData);

        console.info('f_test74: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test74: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data: boolean) => {
            expect(data).assertTrue();

            console.info('f_test74: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              let pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test74: Removes the Record')
              let removeat: boolean = pasteData1.removeRecordAt(0);
              expect(removeat).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_7400 end');
              done();
            })
          });
        });
      });
    })

    /**
     * @tc.name   pasteboard_function_test75
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_offRemoteUpdate_0300
     * @tc.desc   Test pasteBoard API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pasteboard_function_test75', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_pasteBoard_function_JS_API_7500 start')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.offRemoteUpdate(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to on. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
        done();
      }
      console.info('SUB_pasteBoard_function_JS_API_7500 end')
    })
  });
}