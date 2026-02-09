'use static'
import { util } from '@kit.ArkTS';

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

