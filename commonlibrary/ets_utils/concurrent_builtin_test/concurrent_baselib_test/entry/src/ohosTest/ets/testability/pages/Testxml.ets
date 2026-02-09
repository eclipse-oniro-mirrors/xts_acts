/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export let testXml =
  '<?xml version=\'1.0\' encoding=\'UTF-8\'?><!DOCTYPE example [<!ENTITY exampleEntity \'这是一个实体引用事件。\'>]><!-- XML注释事件：这是一个示例注释 --><example><!-- 启动文件事件 --><startDocument><startTag><element><!-- 启动标签事件 --><tagName>示例标签</tagName><!-- 文本事件 --><content>这是一些文本内容。</content>' +
    '<!-- CDATA事件 -->' +
    '<cdata><![CDATA[这是一些不需要解析的内容]]></cdata>' +
    '<!-- 处理指令事件 -->' +
    '<?processingInstruction example=\'处理指令内容\'?>' +
    '<!-- 实体引用事件 -->' +
    '<entityReference>&exampleEntity;</entityReference>' +
    '<!-- 空白事件 -->' +
    '<whitespace>     </whitespace>' +
    '</element>' +
    '<!-- 结束标签事件 -->' +
    '</startTag>' +
    '</startDocument>' +
    '<!-- 结束文件事件 -->' +
    '<endDocument/>' +
    '</example>';


export let str2 =
  '!!%22%22%23%23%24%24%25%25\'\'(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~';
export let str2Decode = '!!""##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
export let str3 =
  '%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%2A%2A%2B%2B%2C%2C%2D%2D%2E%2E%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E%5F%5F%60%60%7B%7B%7C%7C%7D%7D%7E%7E';
export let str3Decode = '!!""##$$%%&&\'\'((**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';

export let count = 0;
export let flag = 'a';

export function add() {
  count++;
}

export function waitForSeconds(time: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

export function myFunction(param1: string, param2: string) {
  console.info(param1, param2);
}


export function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans
}

export const TAG = 'ConcurrentTimerTest';

export const specChars =
  ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
