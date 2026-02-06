/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

export const sym = Symbol("key");

export let num1 = 42 + true;

export let num2 = 42 + false;

export let num3 = 42 + null;

export let num4 = 42 + undefined;

// export let str1 = "" + sym;

const unusualPropertyNames = {
    '': '空字符串',
    '!': '砰！'
};

export let unusualPropertyNames1 = unusualPropertyNames[""];

export let unusualPropertyNames2 = unusualPropertyNames["!"];

export const theProtoObj = {
    protoMethod: function () {
        return "proto method";
    }
};

export const handler = {
    handle: function () {
        return "handler method";
    }
};

export const obj = {
    __proto__: theProtoObj,
    handler,
    toString() {
        return "d " + super.toString();
    },
    ["prop_" + (() => 42)()]: 42
};

// 带标签的模板
export const formatArg = (arg) => {
    if (Array.isArray(arg)) {
        return arg.map((part) => `- ${part}`).join("\n");
    }
    if (arg.toString === Object.prototype.toString) {
        return JSON.stringify(arg);
    }
    return arg;
};

export const print = (segments, ...args) => {
    let message = segments[0];
    segments.slice(1).forEach((segment, index) => {
        message += formatArg(args[index]) + segment;
    });
    console.log(message);
};