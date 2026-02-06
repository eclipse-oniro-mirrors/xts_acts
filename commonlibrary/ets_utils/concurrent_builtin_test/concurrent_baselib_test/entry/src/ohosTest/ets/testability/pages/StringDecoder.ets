import { ArkTSUtils, collections, util } from '@kit.ArkTS';
import { newArr } from '../../test/StringDecoder.test';

@Concurrent
export function stringDecoder() {
  let TAG = 'stringDecoder'
  try {
    newArr.forEach(item => {
      console.log('nztest', item)
      let decoder = new util.StringDecoder(item);
      let input1 = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
      let input2 = 'HelloWorld123?HelloWorld123?';
      const decoded1 = decoder.write(input1)
      const decoded2 = decoder.write(input2)
      if (item === 'utf-16be') {
        let input2 = 'HelloWorld123?HelloWorld123?';
      }
      if (decoded1 !== 'HelloWorld123?') {
        throw new Error(`${TAG} value.toString() invalid: ${decoded1.toString()}`)
      }
      if (decoded2 !== 'HelloWorld123?HelloWorld123?') {
        throw new Error(`${TAG} value.toString() invalid: ${decoded2.toString()}`)
      }
      let input3 = input1.slice(0, 5);
      let input33 = input1.slice(5);
      const decoded3 = decoder.write(input3)
      const decodedend3 = decoder.write(input33)
      if (decoded3 !== 'Hello') {
        throw new Error(`${TAG} value.toString() invalid: ${decoded3.toString()}`)
      }
      if (decodedend3 !== 'World123?') {
        throw new Error(`${TAG} value.toString() invalid: ${decodedend3.toString()}`)
      }
      let input4 = input1.slice(0, 1);
      let input44 = input1.slice(1);
      const decoded4 = decoder.write(input4)
      const decodedend4 = decoder.write(input44)
      if (decoded4 !==  'H') {
        throw new Error(`${TAG} value.toString() invalid: ${decoded4.toString()}`)
      }
      if (decodedend4 !==  'elloWorld123?') {
        throw new Error(`${TAG} value.toString() invalid: ${decodedend4.toString()}`)
      }
    })
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function textEncoder() {
  let TAG = 'textEncoder'
  try {
    let that = new util.TextEncoder('utf-16be')
    let result = that.encodeInto('HelLoWorLd123?')
    let decoder = new util.StringDecoder('utf-16be')
    const decoded1 = decoder.write(result)
    if (decoded1 !== 'HelLoWorLd123?') {
      throw new Error(`${TAG} value.toString() invalid: ${decoded1.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function textDecoder() {
  let TAG = 'textDecoder'
  try {
    const TAG = 'testArrayScenarios0100 == ';
    let encodingArr =
      ['utf-8', 'UTF-8', 'GBK', 'GB2312', 'GB18030', 'gb18030', 'ibm866', 'iso-8859-1', 'iso-8859-2', 'iso-8859-3',
        'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
        'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
        'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
        'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'big5',
        'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']
    let uint8Array = new Uint8Array([0, 0, 0, 0, 0, 72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

    encodingArr.forEach(item => {
      console.log(TAG + 'encoding', item)
      let textDecoder = util.TextDecoder.create(item, {
        ignoreBOM: false
      })
      let decoded1 = textDecoder.decodeToString(uint8Array)
      let urlcode = encodeURI(decoded1)
      console.info(TAG + `urlcode: ${urlcode}`)
      if (urlcode !== '%00%00%00%00%00HelloWorld123?') {
        throw new Error(`${TAG} value.toString() invalid: ${urlcode.toString()}`)
      }
    })

    let textDecoderBe = util.TextDecoder.create('utf-16be', {
      ignoreBOM: false
    })
    let decodedBe = textDecoderBe.decodeToString(uint8Array)
    let urlcodeBe = encodeURI(decodedBe)
    console.info(TAG + `urlcodeBe: ${urlcodeBe}`)
    if (urlcodeBe !== '%00%00H%E6%95%AC%E6%B1%AF%E5%9D%AF%E7%89%AC%E6%90%B1%E3%88%B3%EF%BF%BD') {
      throw new Error(`${TAG} value.toString() invalid: ${urlcodeBe.toString()}`)
    }
    let textDecoderLe = util.TextDecoder.create('utf-16le', {
      ignoreBOM: false
    })
    let decodedLe = textDecoderLe.decodeToString(uint8Array)
    let urlcodeLe = encodeURI(decodedLe)
    console.info(TAG + `urlcodeLe: ${urlcodeLe}`)
    if (urlcodeLe !== '%00%00%E4%A0%80%E6%B1%A5%E6%BD%AC%E6%BD%97%E6%B1%B2%E3%85%A4%E3%8C%B2%EF%BF%BD') {
      throw new Error(`${TAG} value.toString() invalid: ${urlcodeLe.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

@Concurrent
export function base64Helper() {
  let TAG = 'base64Helper'
  try {
    const TAG = 'testArrayScenarios0200 == ';

    let base64 = new util.Base64Helper();
    let uint8Array = new Uint8Array([
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28
    ])
    let resultEncode1 = base64.encodeSync(uint8Array, util.Type.BASIC)
    let result1 = base64.decodeSync(resultEncode1, util.Type.BASIC)
    console.info(TAG + `result1: ${result1.length} ${result1}`)
    let resultEncode2 = base64.encodeSync(uint8Array, util.Type.BASIC_URL_SAFE)
    let result2 = base64.decodeSync(resultEncode2, util.Type.BASIC_URL_SAFE)
    console.info(TAG + `result2: ${result2.length} ${result2}`)

    if (result1.length !== 360) {
      throw new Error(`${TAG} value.toString() invalid: ${result1.toString()}`)
    }

    }catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}
