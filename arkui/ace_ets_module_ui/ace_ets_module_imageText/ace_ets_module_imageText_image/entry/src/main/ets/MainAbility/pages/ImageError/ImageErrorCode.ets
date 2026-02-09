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
@Entry
@Component
struct ImageOnErrorCodeExample {
  @State image_code1: number | undefined = 0;
  @State image_code2: number | undefined = 0;
  @State image_code3: number | undefined = 0;
  @State image_code4: number | undefined = 0;
  @State image_code5: number | undefined = 0;
  @State image_code6: number | undefined = 0;
  @State image_code7: number | undefined = 0;
  @State image_code8: number | undefined = 0;
  @State image_code9: number | undefined = 0;
  @State image_code10: number | undefined = 0;
  @State image_code11: number | undefined = 0;
  @State image_code12: number | undefined = 0;
  @State image_code13: number | undefined = 0;
  @State image_msg1: string | undefined = '';
  @State image_msg2: string | undefined = '';
  @State image_msg3: string | undefined = '';
  @State image_msg4: string | undefined = '';
  @State image_msg5: string | undefined = '';
  @State image_msg6: string | undefined = '';
  @State image_msg7: string | undefined = '';
  @State image_msg8: string | undefined = '';
  @State image_msg9: string | undefined = '';
  @State image_msg10: string | undefined = '';
  @State image_msg11: string | undefined = '';
  @State image_msg12: string | undefined = '';
  @State image_msg13: string | undefined = '';

  build() {
    Column() {
      Row() {
        Image('dat000a:image/heif;base64,')
          .onError((error: ImageError) => {
            console.info('hhh1 code11: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code1 = (error.error?.code);
            this.image_msg1 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code1}`).key('101000')
        Text(`${this.image_msg1}`).key('101000msg')
      }

      Row() {
        Image('data:image/heif;base64,')
          .onError((error: ImageError) => {
            console.info('hhh1 code13: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code2 = (error.error?.code);
            this.image_msg2 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code2}`).key('102030')
        Text(`${this.image_msg2}`).key('102030msg')
      }

      Row() {
        Image('data:image/jpeg;base64,invalid_base64_string')
          .onError((error: ImageError) => {
            console.info('hhh1 code14: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code3 = (error.error?.code);
            this.image_msg3 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code3}`).key('102031')
        Text(`${this.image_msg3}`).key('102031msg')
      }

      Row() {
        Image('file:///data/storage/el1/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/' +
          'base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/' +
          'cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/base/cache/test image.jpg')
          .onError((error: ImageError) => {
            console.info('hhh1 code15: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code4 = (error.error?.code);
            this.image_msg4 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code4}`).key('102050')
        Text(`${this.image_msg4}`).key('102050msg')
      }

      Row() {
        Image('file:///data/storage/el1/base/cache/test image.jpg')
          .onError((error: ImageError) => {
            console.info('hhh1 code16: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code5 = (error.error?.code);
            this.image_msg5 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code5}`).key('102051')
        Text(`${this.image_msg5}`).key('102051msg')
      }

      Row() {
        Image('resource://rawfile/test.jpg')
          .onError((error: ImageError) => {
            console.log('hhh1 code17:' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code6 = (error.error?.code);
            this.image_msg6 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code6}`).key('102070')
        Text(`${this.image_msg6}`).key('102070msg')
      }

      Row() {
        Image('resource://rawfile/sg34v')
          .onError((error: ImageError) => {
            console.info('hhh1 code22: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code7 = (error.error?.code);
            this.image_msg7 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code7}`).key('102072')
        Text(`${this.image_msg7}`).key('102072msg')
      }

      Row() {
        Image('common/test.jpg')
          .onError((error: ImageError) => {
            console.info('hhh1 code18: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code8 = (error.error?.code);
            this.image_msg8 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code8}`).key('102091')
        Text(`${this.image_msg8}`).key('102091msg')
      }

      Row() {
        Image('file://media/Photos/5')
          .onError((error: ImageError) => {
            console.info('hhh1 code19: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code9 = (error.error?.code);
            this.image_msg9 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code9}`).key('102110')
        Text(`${this.image_msg9}`).key('102110msg')
      }

      Row() {
        Image('file://media/Photo/thumbnail/123')
          .onError((error: ImageError) => {
            console.info('hhh1 code25: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code10 = (error.error?.code);
            this.image_msg10 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code10}`).key('102130')
        Text(`${this.image_msg10}`).key('102130msg')
      }

      Row() {
        Image('memory://data/5')
          .onError((error: ImageError) => {
            console.info('hhh1 code24: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code11 = (error.error?.code);
            this.image_msg11 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code11}`).key('102131')
        Text(`${this.image_msg11}`).key('102131msg')
      }

      Row() {
        Image($r('app.media.image_error_svg'))
          .onError((error: ImageError) => {
            console.info('hhh1 code20: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code12 = (error.error?.code);
            this.image_msg12 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code12}`).key('103100')
        Text(`${this.image_msg12}`).key('103100msg')
      }

      Row() {
        Image($r('app.media.image_error_txt_png'))
          .onError((error: ImageError) => {
            console.info('hhh1 code21: ' + 'hhh1 message:' + error.message + ' ,error.code: ' + error.error?.code +
              ' ,error.msg: ' + error.error?.message);
            this.image_code13 = (error.error?.code);
            this.image_msg13 = (error.error?.message);
          })
          .width('2%')
          .height('2%')
          .border({ color: Color.Blue })
        Text(`${this.image_code13}`).key('103200')
        Text(`${this.image_msg13}`).key('103200msg')
      }
    }
  }
}