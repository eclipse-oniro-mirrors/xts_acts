/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import pasteboard from '@ohos.pasteboard';
import { BusinessError } from '@ohos.base';
let tag = "PASTEBOARDSYNC--------------------"
let systemPasteboard = pasteboard.getSystemPasteboard();

export default function pasteboardDetectPatternsTest() {
  describe('pasteboardDetectPatternsTest', () => {
    beforeAll(async () => {
      console.log(tag+'beforeAll');
    });
    afterAll(async () => {
      console.info(tag+'afterAll');
    });
    beforeEach(async () => {
      console.info(tag+'beforeEach');
      await systemPasteboard.clearDataSync();

    });
    afterEach(async () => {
      console.info(tag+'afterEach');

    });

    /**
     * @tc.name      : pattterns value is pasteboard.Pattern.EMAIL_ADDRESS
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0100
     * @tc.desc      : pattterns value is pasteboard.Pattern.EMAIL_ADDRESS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0100', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0100 ---------start")
      let textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      console.log(tag+'res'+res)
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.EMAIL_ADDRESS];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+'data.sort:'+data.sort().join('')+'patterns.sort:'+patterns.sort().join(''));
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.log(tag+'err.code' + err.code + 'error.message' + err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        console.log(tag+'err.code' + err.code + 'error.message' + err.message);
        expect(null).assertFail()
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0100 ---------end")
    });

    /**
     * @tc.name      : pattterns value is pasteboard.Pattern.URL
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0200
     * @tc.desc      : pattterns value is pasteboard.Pattern.URL
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0200', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0200 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.URL];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.log(tag+'err.code' + err.code + 'error.message' + err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        console.log(tag+'err.code' + err.code + 'error.message' + err.message);
        expect(null).assertFail()
        done()
        }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0200 ---------end")
    });
    /**
     * @tc.name      : pattterns value is pasteboard.Pattern.NUMBER
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0300
     * @tc.desc      : pattterns value is pasteboard.Pattern.NUMBER
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0300', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0300 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.log(tag+'err.code' + err.code + 'error.message' + err.message);
          expect(null).assertFail()
          done()
        });
      }catch(err){
        console.log(tag+'err.code' + err.code + 'error.message' + err.message);
        expect(null).assertFail()
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0300 ---------end")
    });

    /**
     * @tc.name      : pattterns value is pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0400
     * @tc.desc      : pattterns value is pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0400', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0400 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.log(tag+'err.code' + err.code + 'error.message' + err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        console.log(tag+'err.code' + err.code + 'error.message' + err.message);
        expect(null).assertFail()
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0400 ---------end")
    });

    /**
     * @tc.name      : pattterns value is pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0500
     * @tc.desc      : pattterns value is pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0500', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0500 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.log(tag+'err.code' + err.code + 'error.message' + err.message);
          expect(null).assertFail()
          done()
        });
      }catch(err){
        console.log(tag+'err.code' + err.code + 'error.message' + err.message);
        expect(null).assertFail()
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0500 ---------end")
    });
    /**
     * @tc.name      : pattterns value is pasteboard.Pattern.NUMBER,pasteboard.Pattern.URL
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0600
     * @tc.desc      : pattterns value is pasteboard.Pattern.NUMBER,pasteboard.Pattern.URL
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0600', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0600 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER,pasteboard.Pattern.URL];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.log(tag+'err.code' + err.code + 'error.message' + err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        console.log(tag+'err.code' + err.code + 'error.message' + err.message);
        expect(null).assertFail()
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0600 ---------end")
    });
    /**
     * @tc.name      : pattterns value is pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0700
     * @tc.desc      : pattterns value is pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0700', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0700 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          expect(data.sort().join('')).assertEqual(patterns.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.log(tag+'err.code' + err.code + 'error.message' + err.message);
          expect(null).assertFail()
          done()
        });
      }catch(err){
        console.log(tag+'err.code' + err.code + 'error.message' + err.message);
        expect(null).assertFail()
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0700 ---------end")
    });

    /**
     * @tc.name      : pattterns value is []
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0800
     * @tc.desc      : pattterns value is []
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0800', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0800 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0800 ---------end")
    });

    /**
     * @tc.name      : pattterns value is [null,null,undefined]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0900
     * @tc.desc      : pattterns value is [null,null,undefined]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0900', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0900 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [null,null,undefined];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }

      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_0900 ---------end")
    });

    /**
     * @tc.name      : detectPatterns value is null
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1000
     * @tc.desc      : detectPatterns value is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1000', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1000 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      try{
        await systemPasteboard.detectPatterns(null).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1000 ---------end")
    });

    /**
     * @tc.name      : detectPatterns value is undefined
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1100
     * @tc.desc      : detectPatterns value is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1100', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1100 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      try{
        await systemPasteboard.detectPatterns(undefined).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1100 ---------end")
    });

    /**
     * @tc.name      : Patterns value is [123,456]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1200
     * @tc.desc      : Patterns value is [123,456]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1200', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1200 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [123,456];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1200 ---------end")
    });
    /**
     * @tc.name      : Patterns value is [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,521]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1300
     * @tc.desc      : Patterns value is [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,521]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1300', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1300 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,521];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1300 ---------end")
    });

    /**
     * @tc.name      : Patterns value is [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,pasteboard.Pattern.NUMBER]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1400
     * @tc.desc      : Patterns value is [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,pasteboard.Pattern.NUMBER]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1400', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1400 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,pasteboard.Pattern.NUMBER];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(data.sort().join('')).assertEqual('012')
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        console.error(tag+'err.code' + err.code+'error.message'+err.message);
        expect(null).assertFail()
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1400 ---------end")
    });
    /**
     * @tc.name      : Patterns value is [pasteboard.Pattern.NUMBER,null]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1500
     * @tc.desc      : Patterns value is [pasteboard.Pattern.NUMBER,null]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1500', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1500 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER,null];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1500 ---------end")
    });
    /**
     * @tc.name      : Patterns value is [pasteboard.Pattern.NUMBER,undefiend]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1600
     * @tc.desc      : Patterns value is [pasteboard.Pattern.NUMBER,undefiend]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1600', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1600 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.URL,undefined];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1600 ---------end")
    });
    /**
     * @tc.name      : Patterns value is [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,null]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1700
     * @tc.desc      : Patterns value is [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,null]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1700', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1700 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,null];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1700 ---------end")
    });
    /**
     * @tc.name      : Patterns value is [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,undefined]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1800
     * @tc.desc      : Patterns value is [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,undefined]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1800', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1800 ---------start")
      const textData = "<!DOCTYPE html><html><head><title>" +
        "的厚爱hi哦</title></head><body><h2>恶风无关痛痒和</h2>" +
        "<p>Greg任何人https://exampsaole.com问我的<a href=\"https://exaeqdwerfmple.com\">" +
        "如果qwiuyhw@huedqw.dsh站</a>。</p></body></html>";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.NUMBER,pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL,undefined];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          console.log(tag+data.sort().join(''))
          expect(null).assertFail()
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(err.code).assertEqual('401')
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1800 ---------end")
    });
    /**
     * @tc.name      : textData is 123,Patterns value is [pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1900
     * @tc.desc      : textData is 123,Patterns value is [pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1900', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1900 ---------start")
      const textData = "123";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.URL];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          const patterns1 = [];
          console.log(tag+data.sort().join(''))
          expect(data.sort().join('')).assertEqual(patterns1.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(null).assertFail()
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_1900 ---------end")
    });
    /**
     * @tc.name      : textData is "https://www.baidu.com/",Patterns value is [pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.NUMBER]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_2000
     * @tc.desc      : textData is "https://www.baidu.com/",Patterns value is [pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.NUMBER]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_2000', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_2000 ---------start")
      const textData = "https://www.baidu.com/";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.EMAIL_ADDRESS,pasteboard.Pattern.NUMBER];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          const patterns1 = [];
          console.log(tag+data.sort().join(''))
          expect(data.sort().join('')).assertEqual(patterns1.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(null).assertFail()
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_2000 ---------end")
    });
    /**
     * @tc.name      : textData is "qqq@163.com",Patterns value is [pasteboard.Pattern.URL,pasteboard.Pattern.NUMBER]
     * @tc.number    : SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_2100
     * @tc.desc      : textData is "qqq@163.com",Patterns value is [pasteboard.Pattern.URL,pasteboard.Pattern.NUMBER]
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_2100', 0, async (done: Function) => {
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_2100 ---------start")
      const textData = "qqq@163.com";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,textData);
      await systemPasteboard.setData(pasteData);
      let res = await systemPasteboard.hasData();
      expect(res).assertEqual(true);
      let patterns = [pasteboard.Pattern.URL];
      try{
        await systemPasteboard.detectPatterns(patterns).then((data) => {
          const patterns1 = [];
          console.log(tag+data.sort().join(''))
          expect(data.sort().join('')).assertEqual(patterns1.sort().join(''));
          done()
        }).catch((err: BusinessError)=>{
          console.error(tag+'err.code' + err.code+'error.message'+err.message);
          expect(null).assertFail()
          done()
        })
      }catch(err){
        expect(null).assertFail()
        console.log(tag+'err.code' + err.code+'error.message'+err.message)
        done()
      }
      console.info(tag + "SUB_Pasteboard_Local_SDk_SystemPasteboard_patterns_2100 ---------end")
    });
  })
}