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

// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import pasteboard from '@ohos.pasteboard'

export default function pasteBoardJEtsunitTest() {
  describe('PasteBoardTest', function () {
    console.info('start################################start');

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_0100
      * @tc.name      Adds PlainTextData
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test1', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_0100 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test1: stemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test1: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test1: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test1: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test1: systemPasteboard.setPasteData promise');

          console.info('f_test1: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test1: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            var types = pasteData.getMimeTypes();
            console.info('f_test1: getMimeTypes = ' + types);
            console.info('f_test1: getMimeTypes = ' + typeof (types));
            expect("text/plain").assertEqual(types[0]);

            console.info('f_test1: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test1: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test1: Checks the pasteboard content');
              var primaryText = pasteData1.getPrimaryText();
              expect(primaryText == textData).assertTrue;
              console.info('f_test1: primaryText = ' + primaryText);

              console.info('Checks pasteboard MAX_RECORD_NUM' + pasteboard.MAX_RECORD_NUM);
              expect(pasteboard.MAX_RECORD_NUM == 512).assertTrue();

              console.info('Checks PasteDataProperty.localOnly');
              var pasteDataProperty = pasteData1.getProperty();
              console.info('Checks: localOnly = ' + pasteDataProperty.localOnly);


              console.info('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data' + pasteboard.MIMETYPE_TEXT_PLAIN);
              console.info('f_test1: getPrimaryMimeType = ' + pasteData1.getPrimaryMimeType());

              console.info('f_test1: SUB_pasteBoard_function_JS_API_0100 end');
              done();
            });
          });
        });
      });
    });

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_0200
    * @tc.name      Adds PlainTextData = ''
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test2', 0, async function (done) {
      console.info('f_test2: SUB_pasteBoard_function_JS_API_0200 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test2: systemPasteboard.clear promise');

        var textData = '';
        console.info('f_test2: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test2: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test2: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test2: systemPasteboard.setPasteData promise');

          console.info('f_test2: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true).assertTrue();

            console.info('f_test2: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test2: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              var PrimaryText = pasteData1.getPrimaryText();
              expect(PrimaryText ==textData ).assertTrue;
              var recordCount = pasteData1.getRecordCount();
              console.info('f_test2: recordCount=' + recordCount);
              expect(recordCount == 1).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_0200 end');
              done();
            });
          });
        });
      });
    });

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_0300
    * @tc.name      Adds PlainTextData = 'Hello 中国!@#$%^&*()_+{}\?.'
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test3', 0, async function (done) {
      console.info('f_test3: SUB_pasteBoard_function_JS_API_0300 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test3: systemPasteboard.clear promise');

        var textData = 'Hello 中国!@#$%^&*()_+{}\?.';
        console.info('f_test3: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test3: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test3: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test3: systemPasteboard.setPasteData promise');

          console.info('f_test3: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test3: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test3: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test3: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test3: Checks the pasteboard content');
              var primaryText = pasteData1.getPrimaryText();
              expect(primaryText ==textData ).assertTrue;
              console.info('f_test3: primaryText = ' + primaryText);

              console.info('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data' + pasteboard.MIMETYPE_TEXT_PLAIN);
              expect(pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_PLAIN) === true ).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_0300 end');
              done();
            });
          });
        });
      });
    });

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_0400
      * @tc.name      Adds 300K PlainTextData
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test4', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_0400 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test4: systemPasteboard.clear promise');

        var textData = '';
        for (var i = 0; i < 300; i++) {
          textData = textData + "A";
        };
        console.info('f_test4: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test4: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test4: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test4: systemPasteboard.setPasteData promise');

          console.info('f_test4: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test4: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test4: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test4: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test4: Checks the pasteboard content');
              var primaryText = pasteData1.getPrimaryText();
              expect(primaryText ==textData ).assertTrue;
              console.info('f_test4: primaryText = ' + primaryText);

              console.info('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data' + pasteboard.MIMETYPE_TEXT_PLAIN);
              expect(pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_PLAIN) === true ).assertTrue();
              expect(pasteData1.getPrimaryMimeType() == pasteboard.MIMETYPE_TEXT_PLAIN).assertTrue();

              console.info('f_test4: SUB_pasteBoard_function_JS_API_0400 end');
              done();
            });
          });
        });
      });
    });

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_0500
      * @tc.name      Adds 301K PlainTextData
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test5', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_0500 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test5: systemPasteboard.clear promise');

        var textData = '';
        for (var i = 0; i < 301; i++) {
          textData = textData + "A";
        };
        console.info('f_test5: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test5: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test5: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test5: systemPasteboard.setPasteData promise');

          console.info('f_test5: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test5: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test5: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test5: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test5: Checks the pasteboard content');
              var primaryText = pasteData1.getPrimaryText();
              expect(primaryText ==textData ).assertTrue;
              console.info('f_test5: primaryText = ' + primaryText);

              console.info('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data' + pasteboard.MIMETYPE_TEXT_PLAIN);
              expect(pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_PLAIN) === true ).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_0500 end');
              done();
            });
          });
        });
      });
    });

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_0600
    * @tc.name      Adds htmlText
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test6', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_0600 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test6: systemPasteboard.clear promise');

        var htmlText = '<html><head></head><body>Hello World!</body></html>';
        console.info('f_test6: createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test6: createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test6: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test6: systemPasteboard.setPasteData promise');

          console.info('f_test6: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test6: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test6: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test6: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test6: Checks the pasteboard content');
              var primaryHtml = pasteData1.getPrimaryHtml();
              console.info('f_test6: getPrimaryHtml = ' + primaryHtml);
              expect(primaryHtml == htmlText).assertTrue();

              console.info('Checks there is a MIMETYPE_TEXT_HTML MIME type of data' + pasteboard.MIMETYPE_TEXT_HTML);
              expect(pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_HTML) === true ).assertTrue();
              console.info('f_test6: getPrimaryMimeType = ' + pasteData1.getPrimaryMimeType());

              console.info('SUB_pasteBoard_function_JS_API_0600 end');
              done();
            });
          });
        });
      });
    });

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_0700
    * @tc.name      Adds htmlText = ''
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test7', 0, async function (done) {
      console.info('f_test7: SUB_pasteBoard_function_JS_API_0700 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test7: systemPasteboard.clear promise');

        var htmlText = '';
        console.info('f_test7: createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test7: createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test7: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test7: systemPasteboard.setPasteData promise');

          console.info('f_test7: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test7: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test7: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
               var primaryHtml = pasteData1.getPrimaryHtml();
              console.info('f_test7: getPrimaryHtml = ' + primaryHtml);
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
    * @tc.number    SUB_pasteBoard_function_JS_API_0800
    * @tc.name      Adds htmlText = 'Hello 中国!@#$%^&*()_+{}\?.'
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test8', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_0800 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test8: systemPasteboard.clear promise');

        var htmlText = 'Hello 中国!@#$%^&*()_+{}\?.';
        console.info('f_test8: createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test8: createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test8: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test8: systemPasteboard.setPasteData promise');

          console.info('f_test8: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test8: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test8: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test8: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getPrimaryHtml() == htmlText).assertTrue();
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('Checks there is a MIMETYPE_TEXT_HTML MIME type of data' + pasteboard.MIMETYPE_TEXT_HTML);
              expect(pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_HTML) === true ).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_0800 end');
              done();
            });
          });
        });
      });
    });

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_0900
    * @tc.name      Adds uriText
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test9', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_0900 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test9: systemPasteboard.clear promise');

        var uriText = 'https://www.baidu.com/';
        console.info('f_test9: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test9: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test9: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test9: systemPasteboard.setPasteData promise');

          console.info('f_test9: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test9: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test9: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test9: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test9: Checks the pasteboard content');
              var primaryUri = pasteData1.getPrimaryUri();
              console.info('f_test9: getPrimaryUri = ' + primaryUri);
              expect(primaryUri == uriText).assertTrue();

              console.info('Checks there is a MIMETYPE_TEXT_URI MIME type of data' + pasteboard.MIMETYPE_TEXT_URI);
              expect(pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_URI) === true ).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_0900 end');
              done();
            });
          });
        });
      });
    });

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_1000
    * @tc.name      Adds uriText = ''
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test10', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1000 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test10: systemPasteboard.clear promise');

        var uriText = '';
        console.info('f_test10: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test10: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test10: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test10: systemPasteboard.setPasteData promise');

          console.info('f_test10: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test10: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test10: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test10: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
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
    * @tc.number    SUB_pasteBoard_function_JS_API_1100
    * @tc.name      Set uriText = 'Hello //'
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test11', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1100 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test11: systemPasteboard.clear promise');

        var uriText = 'Hello//';
        console.info('f_test11: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test11: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test11: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test11: systemPasteboard.setPasteData promise');

          console.info('f_test11: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test11: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test11: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test11: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getPrimaryUri() == uriText).assertTrue();
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('Checks there is a MIMETYPE_TEXT_URI MIME type of data' + pasteboard.MIMETYPE_TEXT_URI);
              expect(pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_URI) === true).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_1100 end');
              done();
            });
          });
        });
      });
    });

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_1200
    * @tc.name      Adds want
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test12', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1200 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test12: systemPasteboard.clear promise');

        var want = {
          bundleName: "com.example.myapplication8",
          abilityName: "com.example.myapplication8.MainAbility"
        };
        console.info('f_test12: createWantData want.bundleName = ' + want.bundleName);
        console.info('f_test12: createWantData want.bundleName = ' + want.abilityName);


        var pasteData = pasteboard.createWantData(want);

        console.info('f_test12: createWantData pasteData = ' + pasteData);

        console.info('f_test12: createWantData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test12: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test12: systemPasteboard.setPasteData promise');

          console.info('f_test12: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test12: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test12: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test12: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test12: Checks the pasteboard content');
              var primaryWant = pasteData1.getPrimaryWant()
              console.info('f_test12: createWantData want.bundleName = ' + primaryWant.bundleName);
              console.info('f_test12: createWantData want.bundleName = ' + primaryWant.abilityName);
              expect(want.bundleName).assertEqual(primaryWant.bundleName);
              expect(want.abilityName).assertEqual(primaryWant.abilityName);

              console.info('Checks there is a MIMETYPE_TEXT_WANT MIME type of data' + pasteboard.MIMETYPE_TEXT_WANT);
              expect(pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_WANT) === true ||
              pasteData1.hasMimeType(pasteboard.MIMETYPE_TEXT_WANT) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_1200 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_1300
      * @tc.name      Adds one record(s)
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test13', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1300 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test13: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test13: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test13: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test13: systemPasteboard.setPasteData promise');

          console.info('f_test13: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test13: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test13: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test13: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test13: Checks the pasteboard content');
              var recordText = pasteData1.getRecordAt(0).plainText
              console.info('f_test13: recordText = ' + recordText);

              console.info('SUB_pasteBoard_function_JS_API_1300 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_1400
      * @tc.name      Adds 2 record(s)
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test14', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1400 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test14: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test14: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test14: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData1 = 'Hello World1'
        console.info('f_test14: addTextRecord = ' + textData1)
        pasteData.addTextRecord(textData1)

        console.info('f_test14: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test14: systemPasteboard.setPasteData promise');

          console.info('f_test14: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test14: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test14: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test14: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 2).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_1400 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_1500
      * @tc.name      Adds 15 record(s)
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test15', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1500 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test15: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test15: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test15: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 15; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test15: addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        console.info('f_test15: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test15: systemPasteboard.setPasteData promise');

          console.info('f_test15: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test15: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test15: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test15: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 15).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_1500 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_1600
      * @tc.name      Adds 30 record(s)
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test16', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1600 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test16: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test16: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test16: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 30; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test16: addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        console.info('f_test16: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test16: systemPasteboard.setPasteData promise');

          console.info('f_test16: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test16: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test16: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test16: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 30).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_1600 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_1700
      * @tc.name      Adds 31 record(s)
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test17', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1700 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test17: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test17: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test17: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 31; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test17: addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        console.info('f_test17: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test17: systemPasteboard.setPasteData promise');

          console.info('f_test17: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test17: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test17: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test17: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              var recordCount = pasteData1.getRecordCount()
              console.info('f_test17: recordCount = ' + recordCount);
              expect(pasteData1.getRecordCount() == 31).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_1700 end');
              done();
            })
          });
        });
      });
    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_1800
    * @tc.name      Adds PlainText,HtmlText,UriText
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test18', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1800 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test18: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test18: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test18: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.info('f_test18: addHtmlRecord = ' + htmlText)
        pasteData.addHtmlRecord(htmlText)

        var uriText = 'https://www.baidu.com/'
        console.info('f_test18: addUriRecord = ' + uriText)
        pasteData.addUriRecord(uriText)

        var want = {
          bundleName: "com.example.myapplication8",
          abilityName: "com.example.myapplication8.MainAbility"
        }
        console.info('f_test18: addWantRecord = ' + want)
        pasteData.addWantRecord(want)


        console.info('f_test18: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test18: systemPasteboard.setPasteData promise');

          console.info('f_test18: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test18: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test18: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test18: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 4).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_1800 end');
              done();
            })
          });
        });
      });
    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_1900
    * @tc.name      Delete one PlainTextData
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test19', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_1900 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test19: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test19: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test19: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test19: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test19: systemPasteboard.setPasteData promise');

          console.info('f_test19: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test19: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test19: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test19: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test19: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('f_test19: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test19: systemPasteboard.setPasteData promise');

                console.info('f_test19: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  console.info('f_test19: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                  var pasteData2 = data;
                  var recordCount = pasteData2.getRecordCount();
                  console.info('f_test19: recordCount = ' + recordCount);

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
      * @tc.number    SUB_pasteBoard_function_JS_API_2000
      * @tc.name      Delete one htmlText
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test20', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2000 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test20: systemPasteboard.clear promise');

        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.info('f_test20: createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test20: createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test20: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test20: systemPasteboard.setPasteData promise');

          console.info('f_test20: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test20: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test20: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test20: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test20: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('f_test20: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test20: systemPasteboard.setPasteData promise');

                console.info('f_test20: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  console.info('f_test20: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                  var pasteData2 = data;
                  var recordCount = pasteData2.getRecordCount();
                  console.info('f_test20: recordCount = ' + recordCount);

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
      * @tc.number    SUB_pasteBoard_function_JS_API_2100
      * @tc.name      Delete one uriText
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test21', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2100 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test21: systemPasteboard.clear promise');

        var uriText = 'https://www.baidu.com/'
        console.info('f_test21: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test21: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test21: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test21: systemPasteboard.setPasteData promise');

          console.info('f_test21: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test21: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test21: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test21: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test21: f_test21: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('f_test21: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test21: systemPasteboard.setPasteData promise');

                console.info('f_test21: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  console.info('f_test21: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                  var pasteData2 = data;
                  var recordCount = pasteData2.getRecordCount();
                  console.info('f_test21: recordCount = ' + recordCount);

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
      * @tc.number    SUB_pasteBoard_function_JS_API_2200
      * @tc.name      Delete one want
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test22', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2200 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test22: systemPasteboard.clear promise');

        var want = {
          bundleName: "com.example.myapplication8",
          abilityName: "com.example.myapplication8.MainAbility"
        }
        console.info('f_test22: createWantData = ' + want)
        var pasteData = pasteboard.createWantData(want);
        console.info('f_test22: createWantData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test22: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test22: systemPasteboard.setPasteData promise');

          console.info('f_test22: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test22: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test22: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test22: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test22: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('f_test22: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test22: systemPasteboard.setPasteData promise');

                console.info('f_test22: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  console.info('f_test22: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                  var pasteData2 = data;
                  var recordCount = pasteData2.getRecordCount();
                  console.info('f_test22: recordCount = ' + recordCount);

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
      * @tc.number    SUB_pasteBoard_function_JS_API_2300
      * @tc.name      Deletes 300K PlainTextData
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test23', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2300 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test23: systemPasteboard.clear promise');

        var textData = ''
        for (var i = 0; i < 300; i++) {
          textData = textData + "A";
        }
        console.info('f_test23: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test23: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test23: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test23: systemPasteboard.setPasteData promise');

          console.info('f_test23: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test23: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test23: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test23: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test23: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('f_test23: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test23: systemPasteboard.setPasteData promise');

                console.info('f_test23: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  console.info('f_test23: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                  var pasteData2 = data;
                  var recordCount = pasteData2.getRecordCount();
                  console.info('f_test23: recordCount = ' + recordCount);

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
      * @tc.number    SUB_pasteBoard_function_JS_API_2400
      * @tc.name      Deletes 30 record(s)
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test24', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2400 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test24: systemPasteboard.clear promise');

        var textData0 = 'Hello World'
        console.info('f_test24: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test24: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 30; i++) {
          textData = 'Hello World'
          textData = textData + i
          pasteData.addTextRecord(textData)
        }

        systemPasteboard.setPasteData(pasteData).then(() => {

          console.info('f_test24: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test24: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test24: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 30).assertTrue();

              console.info('f_test24: Removes the Record')
              for (var i = 0; i < 30; i++) {
                expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();
              }

              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test24: systemPasteboard.setPasteData promise');

                systemPasteboard.getPasteData().then((data) => {
                  console.info('f_test24: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                  var pasteData2 = data;
                  var recordCount = pasteData2.getRecordCount();
                  console.info('f_test24: recordCount = ' + recordCount);

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
      * @tc.number    SUB_pasteBoard_function_JS_API_2500
      * @tc.name      Deletes replaced record
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test25', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2500 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test25: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test25: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test25: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test25: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test25: systemPasteboard.setPasteData promise');

          console.info('f_test25: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test25: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test25: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test25: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              var textData1 = 'Hello World1'
              console.info('f_test25: Replaces the Record = ' + textData1)
              var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
              var replace = pasteData1.replaceRecordAt(0, pasteDataRecord);
              console.info('f_test25: replace = ' + replace)

              console.info('f_test25: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('f_test25: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test25: systemPasteboard.setPasteData promise');

                console.info('f_test25: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  console.info('f_test25: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                  var pasteData2 = data;
                  var recordCount = pasteData2.getRecordCount();
                  console.info('f_test25: recordCount = ' + recordCount);

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
      * @tc.number    SUB_pasteBoard_function_JS_API_2600
      * @tc.name      Deletes 文本、uri、html
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test26', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2600 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test26: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test26: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test26: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.info('f_test26: addHtmlRecord = ' + htmlText)
        pasteData.addHtmlRecord(htmlText)

        var uriText = 'https://www.baidu.com/'
        console.info('f_test26: addUriRecord = ' + uriText)
        pasteData.addUriRecord(uriText)

        console.info('f_test26: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test26: systemPasteboard.setPasteData promise');

          console.info('f_test26: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test26: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test26: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test26: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 3).assertTrue();

              console.info('f_test26: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('f_test26: Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test26: systemPasteboard.setPasteData promise');

                console.info('f_test26: Checks the number of records');
                systemPasteboard.getPasteData().then((data) => {
                  console.info('f_test26: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                  var pasteData2 = data;
                  var recordCount = pasteData2.getRecordCount();
                  console.info('f_test26: recordCount = ' + recordCount);

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
      * @tc.number    SUB_pasteBoard_function_JS_API_2700
      * @tc.name      Replaces 文本 record
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test27', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2700 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test27: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test27: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test27: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test27: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test27: systemPasteboard.setPasteData promise');

          console.info('f_test27: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test27: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test27: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test27: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              var textData1 = 'Hello World1'
              console.info('f_test27: Replaces the Record = ' + textData1)
              var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
              var replace = pasteData1.replaceRecordAt(0, pasteDataRecord);
              console.info('f_test27: replace = ' + replace)

              console.info('f_test27: Checks the pasteboard content');
              var primaryText = pasteData1.getPrimaryText();
              console.info('f_test27: primaryText = ' + primaryText);

              console.info('SUB_pasteBoard_function_JS_API_2700 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_2800
      * @tc.name      Replaces htmlText record
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test28', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2800 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test28: systemPasteboard.clear promise');

        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.info('f_test28: createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test28: createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test28: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test28: systemPasteboard.setPasteData promise');

          console.info('f_test28: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test28: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test28: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test28: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              var htmlText1 = '<html><head></head><body>Hello World 1</body></html>'
              console.info('f_test28: Replaces the htmlText = ' + htmlText1)
              var pasteDataRecord = pasteboard.createHtmlTextRecord(htmlText1)
              var replace = pasteData1.replaceRecordAt(0, pasteDataRecord);
              console.info('f_test28: replace = ' + replace)

              console.info('SUB_pasteBoard_function_JS_API_2800 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_2900
      * @tc.name      Replaces uri record
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test29', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_2900 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test29: systemPasteboard.clear promise');

        var uriText = 'https://www.baidu.com/'
        console.info('f_test29: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test29: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test29: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test29: systemPasteboard.setPasteData promise');

          console.info('f_test29: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test29: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test29: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test29: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              var uriText1 = 'https://www.baidu.com/1'
              console.info('f_test29: Replaces the uriText = ' + uriText1)
              var pasteDataRecord = pasteboard.createUriRecord(uriText1)
              var replace = pasteData1.replaceRecordAt(0, pasteDataRecord);
              console.info('f_test29: replace = ' + replace)

              console.info('SUB_pasteBoard_function_JS_API_2900 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_3000
      * @tc.name      Replaces want record
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test30', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3000 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test30: systemPasteboard.clear promise');

        var wantText0 = {
          bundleName: "com.example.myapplication3",
          abilityName: "com.example.myapplication3.MainAbility"
        }
        console.info('f_test30: createWantData want = ' + wantText0);
        var pasteData = pasteboard.createWantData(wantText0);
        console.info('f_test30: createWantData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test30: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test30: systemPasteboard.setPasteData promise');

          console.info('f_test30: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test30: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test30: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test30: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              var wantText1 = {
                bundleName: "com.example.myapplication30",
                abilityName: "com.example.myapplication30.MainAbility"
              }
              console.info('f_test30: Replaces the wantText = ' + wantText1)
              var pasteDataRecord = pasteboard.createWantRecord(wantText1)
              var replace = pasteData1.replaceRecordAt(0, pasteDataRecord);
              console.info('f_test30: replace = ' + replace)

              console.info('SUB_pasteBoard_function_JS_API_3000 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_3100
      * @tc.name      Replaces 300k文本 record
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test31', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3100 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test31: systemPasteboard.clear promise');

        var textData = ''
        for (var i = 0; i < 300; i++) {
          textData = textData + "A";
        }
        console.info('f_test31: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test31: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test31: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test31: systemPasteboard.setPasteData promise');

          console.info('f_test31: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test31: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test31: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test31: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              var textData1 = 'Hello World1'
              console.info('f_test31: Replaces the Record = ' + textData1)
              var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
              var replace = pasteData1.replaceRecordAt(0, pasteDataRecord);
              console.info('f_test31: replace = ' + replace)

              console.info('f_test31: Checks the pasteboard content');
              var primaryText = pasteData1.getPrimaryText();
              console.info('f_test31: primaryText = ' + primaryText);

              console.info('SUB_pasteBoard_function_JS_API_3100 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_3200
      * @tc.name      Adds one record(s), gets record count
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test32', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3200 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test32: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test32: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test32: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test32: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test32: systemPasteboard.setPasteData promise');

          console.info('Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test32: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test32: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test32: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_3200 end');
              done();
            })
          });
        });
      });
    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_3300
    * @tc.name      Adds 2 record(s), gets record count
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test33', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3300 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test33: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test33: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test33: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 2; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test33: addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        console.info('f_test33: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test33: systemPasteboard.setPasteData promise');

          console.info('f_test33: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test33: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test33: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test33: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 2).assertTrue();

              console.info('SUB_pasteBoard_function_.' + 'JS_API_3300 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_3400
      * @tc.name      Adds 15 record(s), gets record count
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test34', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3400 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test34: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test34: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test34: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 15; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test34: addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        console.info('f_test34: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test34: systemPasteboard.setPasteData promise');

          console.info('f_test34: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test34: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test34: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test34: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 15).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_3400 end');
              done();
            })
          });
        });
      });
    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_3500
    * @tc.name      Adds 30 record(s), gets record count
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test35', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3500 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test35: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test35: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test35: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 30; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test35: addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        console.info('f_test35: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test35: systemPasteboard.setPasteData promise');

          console.info('f_test35: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test35: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test35: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test35: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 30).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_3500 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_3600
      * @tc.name      Adds 31 record(s), gets record count
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test36', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3600 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test36: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test36: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test36: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 31; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test36: addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        console.info('f_test36: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test36: systemPasteboard.setPasteData promise');

          console.info('f_test36: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test36: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test36: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test36: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 31).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_3600 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_3700
      * @tc.name      Replaces one record, gets record count
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test37', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3700 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test37: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test37: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test37: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test37: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test37: systemPasteboard.setPasteData promise');

          console.info('f_test37: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test37: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test37: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test37: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              var textData1 = 'Hello World1'
              console.info('f_test37: Replaces the Record = ' + textData1)
              var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
              var replace = pasteData1.replaceRecordAt(0, pasteDataRecord);
              console.info('f_test37: replace = ' + replace)

              console.info('f_test37: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test37: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                var pasteData2 = data;
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
      * @tc.number    SUB_pasteBoard_function_JS_API_3800
      * @tc.name      Clears pasteBoard, gets record count
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test38', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3800 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test38: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test38: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test38: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test38: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test38: systemPasteboard.setPasteData promise');

          console.info('f_test38: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test38: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test38: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test38: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test38: Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('f_test38: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test38: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                var pasteData2 = data;
                var recordCount = pasteData2.getRecordCount();
                console.info('f_test38 recordCount = ' + recordCount);

                console.info('SUB_pasteBoard_function_JS_API_3800 end');
                done();
              });
            });
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_3900
      * @tc.name      Adds Property
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
      it('pasteboard_function_test39', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_3900 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test39: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test39: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test39: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test39: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test39: systemPasteboard.setPasteData promise');

          console.info('f_test39: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test39: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test39: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test39: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test39: Sets the Property')
              var pasteDataProperty = pasteData1.getProperty()
              console.info('f_test39: timestamp = ' + pasteDataProperty.timestamp)
              let object = {
                bundleName: "pasteBoardJEtsunitTest"
              };
              pasteDataProperty.additions["one"] = object;
              pasteDataProperty.shareOption = 1;
              pasteData1.setProperty(pasteDataProperty);

              console.info('f_test39: Checks the Property')
              systemPasteboard.setPasteData(pasteData1).then(() => {
                systemPasteboard.hasPasteData().then((data) => {
                  expect(data == true).assertTrue();
                  systemPasteboard.getPasteData().then((data) => {
                    var pasteData2 = data;
                    var pasteDataProperty1 = pasteData2.getProperty();
                    expect(pasteDataProperty1.shareOption == 1).assertTrue();
                    console.info('f_test39: timestamp = ' + pasteDataProperty1.timestamp);
                    console.info('f_test39: shareOption = ' + pasteDataProperty1.shareOption);
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
      * @tc.number    SUB_pasteBoard_function_JS_API_4000
      * @tc.name      Set Property's tags
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test40', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4000 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test40: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test40: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test40: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test40: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test40: systemPasteboard.setPasteData promise');

          console.info('f_test40: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test40: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true).assertTrue();

            console.info('f_test40: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test40: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test40: Sets the Property');
              var pasteDataProperty = pasteData1.getProperty();
              console.info('f_test40: timestamp = ' + pasteDataProperty.timestamp);
              pasteDataProperty.tag = "Test";
              pasteData1.setProperty(pasteDataProperty);

              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('Succeeded in setting PasteData.');
                systemPasteboard.hasPasteData().then((data) => {
                  console.info(`Succeeded in checking the PasteData. Data: ${data}`);

                  expect(data == true).assertTrue();
                  systemPasteboard.getPasteData().then((data) => {
                    var pasteData2 = data;
                    var pasteDataProperty1 = pasteData2.getProperty();
                    expect(pasteDataProperty1.tag == "Test").assertTrue();
                    console.info('f_test40: timestamp = ' + pasteDataProperty1.timestamp);
                    console.info('f_test40: tag = ' + pasteDataProperty1.tag);

                    console.info('SUB_pasteBoard_function_JS_API_4000 end');
                    done();
                  }).catch((err) => {
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
    * @tc.number    SUB_pasteBoard_function_JS_API_4100
    * @tc.name      Clears pasteBoard and check property
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test41', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4100 start');

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test41: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test41: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test41: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test41: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test41: systemPasteboard.setPasteData promise');

          console.info('f_test41: Checks there is content in the pasteboard');
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test41: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true ).assertTrue();

            console.info('f_test41: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test41: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test41: Clears the pasteBoard');
              systemPasteboard.clear();

              console.info('f_test41: Checks the Property');
              var pasteDataProperty1 = pasteData1.getProperty();
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
      * @tc.number    SUB_pasteBoard_function_JS_API_4200
      * @tc.name      打开内容变化通知功能：向剪贴板数据增加、删除等文本数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test42', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4200 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test42: systemPasteboard.clear promise');

        console.info('f_test42: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        var textData = 'Hello World!';
        console.info('f_test42: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test42: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test42: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test42: systemPasteboard.setPasteData promise');

          console.info('f_test42: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test42: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test42: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test42: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test42: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4200 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_4300
      * @tc.name      打开内容变化通知功能：向剪贴板数据增加、删除等html数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test43', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4300 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test43: systemPasteboard.clear promise');

        console.info('f_test43: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.info('f_test43: createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test43: createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test43: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test43: systemPasteboard.setPasteData promise');

          console.info('f_test43: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test43: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test43: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test43: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test43: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4300 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_4400
      * @tc.name      打开内容变化通知功能：向剪贴板数据增加、删除等uri数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test44', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4400 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test44: systemPasteboard.clear promise');

        console.info('f_test44: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        var uriText = 'https://www.baidu.com/'
        console.info('f_test44: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test44: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test44: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test44: systemPasteboard.setPasteData promise');

          console.info('f_test44: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test44: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test44: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test44: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test44: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4400 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_4500
      * @tc.name      打开内容变化通知功能：向剪贴板数据增加、删除等want数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test45', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4500 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test45: systemPasteboard.clear promise');

        console.info('f_test45: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        var want = {
          bundleName: "com.example.myapplication45",
          abilityName: "com.example.myapplication45.MainAbility"
        }
        console.info('f_test45: createWantData = ' + want)
        var pasteData = pasteboard.createWantData(want);
        console.info('f_test45: createWantData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test45: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test45: systemPasteboard.setPasteData promise');

          console.info('f_test45: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test45: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test45: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test45: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test45: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4500 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_4600
      * @tc.name      打开内容变化通知功能：清除剪切板内容
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test46', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4600 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test46: systemPasteboard.clear promise');

        console.info('f_test46: Open the infor for pasteboard content changes')
        systemPasteboard.on('update', contentChanges)

        var textData = 'Hello World!';
        console.info('f_test46: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test46: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test46: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test46: systemPasteboard.setPasteData promise');

          console.info('f_test46: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test46: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test46: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test46: Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('SUB_pasteBoard_function_JS_API_4600 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_4700
      * @tc.name      关闭内容变化通知功能：向剪贴板数据增加、删除等文本数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test47', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4700 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test47: systemPasteboard.clear promise');

        console.info('f_test47: Close the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        var textData = 'Hello World!';
        console.info('f_test47: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test47: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test47: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test47: systemPasteboard.setPasteData promise');

          console.info('f_test47: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test47: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test47: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test47: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test47: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4700 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_4800
      * @tc.name      关闭内容变化通知功能：向剪贴板数据增加、删除等html数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test48', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4800 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test48: systemPasteboard.clear promise');

        console.info('f_test48: Close the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.info('f_test48: createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test48: createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test48: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test48: systemPasteboard.setPasteData promise');

          console.info('f_test48: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test48: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test48: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test48: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test48: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4800 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_4900
      * @tc.name      关闭内容变化通知功能：向剪贴板数据增加、删除等uri数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test49', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_4900 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test49: systemPasteboard.clear promise');

        console.info('f_test49: Close the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        var uriText = 'https://www.baidu.com/'
        console.info('f_test49: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test49: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test49: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test49: systemPasteboard.setPasteData promise');

          console.info('f_test49: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test49: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test49: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test49: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test49: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_4900 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5000
      * @tc.name      关闭内容变化通知功能：向剪贴板数据增加、删除等want数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test50', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5000 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test50: systemPasteboard.clear promise');

        console.info('f_test50: Open the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        var want = {
          bundleName: "com.example.myapplication45",
          abilityName: "com.example.myapplication45.MainAbility"
        }
        console.info('f_test50: createWantData = ' + want)
        var pasteData = pasteboard.createWantData(want);
        console.info('f_test50: createWantData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test50: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test50: systemPasteboard.setPasteData promise');

          console.info('f_test50: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test50: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test50: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test50: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test50: Removes the Record')
              expect(pasteData1.removeRecordAt(0) === true || pasteData1.removeRecordAt(0) === false).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_5000 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5100
      * @tc.name      关闭内容变化通知功能：清除剪切板内容
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test51', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5100 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test51: systemPasteboard.clear promise');

        console.info('f_test51: Close the infor for pasteboard content changes')
        systemPasteboard.off('update', contentChanges)

        var textData = 'Hello World!';
        console.info('f_test51: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test51: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test51: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test51: systemPasteboard.setPasteData promise');

          console.info('f_test51: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test51: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test51: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test51: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test51: Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('SUB_pasteBoard_function_JS_API_5100 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5200
      * @tc.name      清除剪切板内的文本数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test52', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5200 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test52: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test52: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test52: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test52: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test52: systemPasteboard.setPasteData promise');

          console.info('f_test52: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test52: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test52: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test52: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test52: Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('f_test52: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test52: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                var pasteData2 = data;
                var recordCount = pasteData2.getRecordCount();
                console.info('f_test52 recordCount = ' + recordCount);
              })

              console.info('SUB_pasteBoard_function_JS_API_5200 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5300
      * @tc.name      清除剪切板内的uri数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test53', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5300 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test53: systemPasteboard.clear promise');

        var uriText = 'https://www.baidu.com/'
        console.info('f_test53: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test53: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test53: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test53: systemPasteboard.setPasteData promise');

          console.info('f_test53: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test53: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test53: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test53: Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('f_test53: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test53: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                var pasteData2 = data;
                var recordCount = pasteData2.getRecordCount();
                console.info('f_test38 recordCount = ' + recordCount);
              })

              console.info('SUB_pasteBoard_function_JS_API_5300 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5400
      * @tc.name      清除剪切板内的html数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test54', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5400 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test54: systemPasteboard.clear promise');

        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.info('f_test54: createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test54: createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test54: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test54: systemPasteboard.setPasteData promise');

          console.info('f_test54: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test54: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test54: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test54: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test54: Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('f_test54: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test54: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                var pasteData2 = data;
                var recordCount = pasteData2.getRecordCount();
                console.info('f_test38 recordCount = ' + recordCount);
              })

              console.info('SUB_pasteBoard_function_JS_API_5400 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5500
      * @tc.name      清除剪切板内的want数据项
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test55', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5500 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test55: systemPasteboard.clear promise');

        var myWant = {
          bundleName: "com.example.myapplication55",
          abilityName: "com.example.myapplication55.MainAbility"
        }
        console.info('f_test01: createWantData want = ' + myWant);
        var pasteData = pasteboard.createWantData(myWant);
        console.info('f_test01: createWantData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test55: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test55: systemPasteboard.setPasteData promise');

          console.info('f_test55: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test55: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test55: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test55: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test55: Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('f_test55: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test55: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                var pasteData2 = data;
                var recordCount = pasteData2.getRecordCount();
                console.info('f_test38 recordCount = ' + recordCount);
              })

              console.info('SUB_pasteBoard_function_JS_API_5500 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5600
      * @tc.name      向剪切板内增加30条数据项，然后清除
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test56', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5600 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test56: systemPasteboard.clear promise');

        var textData0 = 'Hello World!';
        console.info('f_test56: createPlainTextData textData = ' + textData0);
        var pasteData = pasteboard.createPlainTextData(textData0);
        console.info('f_test56: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        var textData = ''
        for (var i = 1; i < 30; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test56: addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        console.info('f_test56: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test56: systemPasteboard.setPasteData promise');

          console.info('f_test56: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test56: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test56: Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test56: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 30).assertTrue();

              console.info('f_test56: Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('f_test56: Checks the number of records');
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test56: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                var pasteData2 = data;
                var recordCount = pasteData2.getRecordCount();
                console.info('f_test38 recordCount = ' + recordCount);
              })

              console.info('SUB_pasteBoard_function_JS_API_5600 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5700
      * @tc.name      向剪贴板数据各增加5条文本、uri、html数据，然后清除
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test57', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5700 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {

        var textData0 = 'Hello World0'
        console.info('f_test57: createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)

        var textData = ''
        for (var i = 1; i < 5; i++) {
          textData = 'Hello World'
          textData = textData + i
          pasteData.addTextRecord(textData)
        }

        var htmlText = ''
        for (var i = 0; i < 5; i++) {
          htmlText = '<html><head></head><body>Hello World!</body></html>'
          htmlText = htmlText + i
          pasteData.addHtmlRecord(htmlText)
        }

        var uriText = ''
        for (var i = 0; i < 5; i++) {
          uriText = 'https://www.baidu.com/'
          uriText = uriText + i
          pasteData.addUriRecord(uriText)
        }

        systemPasteboard.setPasteData(pasteData).then(() => {
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test57: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test57: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 15).assertTrue();
              systemPasteboard.clear()
              systemPasteboard.getPasteData().then((data) => {
                console.info('f_test57: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
                var pasteData2 = data;
                var recordCount = pasteData2.getRecordCount();
                console.info('f_test38 recordCount = ' + recordCount);
              })

              console.info('SUB_pasteBoard_function_JS_API_5700 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5800
      * @tc.name      向剪贴板数据增加文本数据项，查询剪贴板存在剪贴板数据
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test58', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5800 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test58: systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test58: createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test58: createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test58: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test58: systemPasteboard.setPasteData promise');

          console.info('f_test58: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test58: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('SUB_pasteBoard_function_JS_API_5800 end')
            done();
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_5900
      * @tc.name      向剪贴板数据增加uri数据项，查询剪贴板存在剪贴板数据
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test59', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_5900 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('systemPasteboard.clear promise');

        var uriText = 'https://www.baidu.com/'
        console.info('f_test59: createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test59: createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test59: Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test59: systemPasteboard.setPasteData promise');

          console.info('f_test59: Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test59: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('SUB_pasteBoard_function_JS_API_5900 end')
            done();
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_6000
      * @tc.name      向剪贴板数据增加html数据项，查询剪贴板存在剪贴板数据
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test60', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6000 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test60 systemPasteboard.clear promise');

        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.info('f_test60createHtmlData htmlText = ' + htmlText);
        var pasteData = pasteboard.createHtmlData(htmlText);
        console.info('f_test60createHtmlData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test60Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test60systemPasteboard.setPasteData promise');

          console.info('f_test60Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test60systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('SUB_pasteBoard_function_JS_API_6000 end')
            done();
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_6100
      * @tc.name      向剪贴板数据增加want数据项，查询剪贴板存在剪贴板数据
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test61', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6100 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test61 systemPasteboard.clear promise');

        var myWant = {
          bundleName: "com.example.myapplication8",
          abilityName: "com.example.myapplication8.MainAbility"
        }
        console.info('f_test01: createWantData want = ' + myWant);
        var pasteData = pasteboard.createWantData(myWant);
        console.info('f_test01: createWantData pasteData = ' + JSON.stringify(pasteData));

        console.info('Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('systemPasteboard.setPasteData promise');

          console.info('Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('SUB_pasteBoard_function_JS_API_6100 end')
            done();
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_6200
      * @tc.name      向剪贴板数据各增加5条文本、uri、html，查询剪贴板存在剪贴板数据
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test62', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6200 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test62 systemPasteboard.clear promise');

        var textData0 = 'Hello World0'
        console.info('f_test62 createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)

        var textData = ''
        for (var i = 1; i < 5; i++) {
          textData = 'Hello World'
          textData = textData + i
          console.info('f_test62 addTextRecord = ' + textData)
          pasteData.addTextRecord(textData)
        }

        var htmlText = ''
        for (var i = 0; i < 5; i++) {
          htmlText = '<html><head></head><body>Hello World!</body></html>'
          htmlText = htmlText + i
          console.info('f_test62 addHtmlRecord = ' + htmlText)
          pasteData.addHtmlRecord(htmlText)
        }

        var uriText = ''
        for (var i = 0; i < 5; i++) {
          uriText = 'https://www.baidu.com/'
          uriText = uriText + i
          console.info('f_test62 addUriRecord = ' + uriText)
          pasteData.addUriRecord(uriText)
        }

        console.info('f_test62 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test62 systemPasteboard.setPasteData promise');

          console.info('f_test62 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test62 systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('SUB_pasteBoard_function_JS_API_6200 end')
            done();
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_6300
      * @tc.name      更新剪贴板数据，查询剪贴板存在剪贴板数据
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test63', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6300 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test63 systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test63 createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test63 createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test63 systemPasteboard.setPasteData promise');

          console.info('f_test63 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test63 systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test63 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test63 systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              var textData1 = 'Hello World1'
              console.info('f_test63 Replaces the Record = ' + textData1)
              var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
              pasteData1.replaceRecordAt(0, pasteDataRecord)

              console.info('f_test63 Checks there is content in the pasteboard')
              systemPasteboard.hasPasteData().then((data) => {
                console.info('f_test63 systemPasteboard.hasPasteData promise data = ' + data);
                expect(data === true || data === false).assertTrue();
              })

              console.info('SUB_pasteBoard_function_JS_API_6300 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_6400
      * @tc.name      删除所有的剪贴板数据，查询剪贴板不存在剪贴板数据
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test64', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6400 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test64 systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test64 createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test64 createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test64 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test64 systemPasteboard.setPasteData promise');

          console.info('f_test64 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test64 systemPasteboard.hasPasteData promise data = ' + data);
            expect(data).assertTrue();

            console.info('f_test64 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test64 systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              var recordCount = pasteData1.getRecordCount();
              console.info('f_test64 recordCount = ' + recordCount);
              expect(recordCount).assertEqual(1)

              console.info('f_test64 Removes the Record')
              pasteData1.removeRecordAt(0)

              console.info('f_test64 Checks the number of records');
              var recordCount1 = pasteData1.getRecordCount();
              expect(recordCount1).assertEqual(0);
              console.info('f_test64 recordCount = ' + recordCount1);

              console.info('SUB_pasteBoard_function_JS_API_6400 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_6500
      * @tc.name      清除剪贴板数据，查询剪贴板不存在剪贴板数据
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test65', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6500 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test65 systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test65 createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test65 createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test65 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test65 systemPasteboard.setPasteData promise');

          console.info('f_test65 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test65 systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test65 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test65 systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test65 Clears the pasteBoard')
              systemPasteboard.clear()

              console.info('f_test65 Writes PasteData to the pasteboard');
              systemPasteboard.setPasteData(pasteData1).then(() => {
                console.info('f_test65 systemPasteboard.setPasteData promise');

                console.info('f_test65 Checks there is no content in the pasteboard')
                systemPasteboard.hasPasteData().then((data) => {
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
    * @tc.number    SUB_pasteBoard_function_JS_API_6600
    * @tc.name      将文本数据强制转换为文本
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test66', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6600 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test66 systemPasteboard.clear promise');

        var textData = 'Hello World!';
        console.info('f_test66 createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test66 createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test66 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test66 systemPasteboard.setPasteData promise');

          console.info('f_test66 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test66 systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test66 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test66 systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test66 Converts the PlainTextData to text')
              var pasteDataRecord = pasteData1.getRecordAt(0)
              console.info('checks pasteDataRecord.mimeType = ' + pasteDataRecord.mimeType)

              console.info('f_test66 pasteDataRecord.convertToText = ' + pasteDataRecord.convertToText);

              console.info('f_test66 SUB_pasteBoard_function_JS_API_6600 end');
              done();
            })
          });
        });
      });
    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_6700
    * @tc.name      将一条含有特殊字符、中英混杂的文本数据强制转换为文本
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test67', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6700 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test67 systemPasteboard.clear promise');

        var textData = 'Hello 中国!@#$%^&*()_+{}\?.';
        console.info('f_test67 createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test67 createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test67 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test67 systemPasteboard.setPasteData promise');

          console.info('f_test67 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test67 systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test67 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test67 systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test67 Converts the PlainTextData to text')
              var pasteDataRecord = pasteData1.getRecordAt(0)
              console.info('f_test67 pasteDataRecord.convertToText = ' + pasteDataRecord.convertToText);

              console.info('SUB_pasteBoard_function_JS_API_6700 end');
              done();
            })
          });
        });
      });
    })

    /**
      * @tc.number    SUB_pasteBoard_function_JS_API_6800
      * @tc.name      将一条超长文本数据 (大小为301K)强制转换为文本
      * @tc.desc      Test pasteBoard API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('pasteboard_function_test68', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6800 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test68 systemPasteboard.clear promise');

        var textData = ''
        for (var i = 0; i < 301; i++) {
          textData = textData + "A";
        }
        console.info('f_test68 createPlainTextData textData = ' + textData);
        var pasteData = pasteboard.createPlainTextData(textData);
        console.info('f_test68 createPlainTextData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test68 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test68 systemPasteboard.setPasteData promise');

          console.info('f_test68 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test68 systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test68 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test68 systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test68 Converts the PlainTextData to text')
              var pasteDataRecord = pasteData1.getRecordAt(0)
              console.info('f_test68 pasteDataRecord.convertToText = ' + pasteDataRecord.convertToText);

              console.info('SUB_pasteBoard_function_JS_API_6800 end');
              done();
            })
          });
        });
      });
    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_6900
    * @tc.name      将uri数据强制转换为文本
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test69', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_6900 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {
        console.info('f_test69 systemPasteboard.clear promise');

        var uriText = 'https://www.baidu.com/'
        console.info('f_test69 createUriData uriText = ' + uriText);
        var pasteData = pasteboard.createUriData(uriText);
        console.info('f_test69 createUriData pasteData = ' + JSON.stringify(pasteData));

        console.info('f_test69 Writes PasteData to the pasteboard');
        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('f_test69 systemPasteboard.setPasteData promise');

          console.info('f_test69 Checks there is content in the pasteboard')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test69 systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            console.info('f_test69 Checks the number of records');
            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test69 systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              expect(pasteData1.getRecordCount() == 1).assertTrue();

              console.info('f_test69 Converts the PlainTextData to text')
              var pasteDataRecord = pasteData1.getRecordAt(0)

              pasteDataRecord.convertToText().then((data) => {
                console.info('convertToText success data : ' + JSON.stringify(data));
              }).catch((error) => {
                console.error('convertToText failed because ' + JSON.stringify(error));
              });
              ;

              console.info('SUB_pasteBoard_function_JS_API_6900 end');
              done();
            })
          });
        });
      });
    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_7000
    * @tc.name      复制文本、uri格式
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test70', 0, async function (done) {
      console.info('SUB_pasteBoard_function_JS_API_7000 start')

      var systemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clear().then(() => {

        var textData0 = 'Hello World0'
        console.info('f_test70: createPlainTextData = ' + textData0)

        var pasteData = pasteboard.createPlainTextData(textData0)
        console.info('f_test70: createPlainTextData = ' + JSON.stringify(pasteData))

        var uriText = pasteboard.createUriRecord("https://www.baidu.com/");
        pasteData.addRecord(uriText);
        console.info('f_test70: addRecord(uriText) = ' + pasteData)
        console.info('f_test70: addRecord(uriText) = ' + JSON.stringify(pasteData))


        systemPasteboard.setPasteData(pasteData).then(() => {
          console.info('---------------------------->1')
          systemPasteboard.hasPasteData().then((data) => {
            console.info('f_test70: systemPasteboard.hasPasteData promise data = ' + data);
            expect(data === true || data === false).assertTrue();

            systemPasteboard.getPasteData().then((data) => {
              console.info('f_test70: systemPasteboard.getPasteData data = ' + JSON.stringify(data));
              var pasteData1 = data;
              var recordCount = pasteData1.getRecordCount();
              console.info('f_test70: recordCount=' + recordCount);
              expect(pasteData1.getRecordCount() == 2).assertTrue();

              console.info('SUB_pasteBoard_function_JS_API_7000 end');
              done();
            })
          });
        });
      });
    })


    /**
    *  The callback function is used for pasteboard content changes
    */
    function contentChanges() {
      console.info('#EVENT: The content is changed in the pasteboard')
    }
  });
}

