/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
export function test1() {
    return 0;

}

export function test1016() {
    try {
        return [
            "HELLO".toLocaleLowerCase(null),
            "TEST".toLocaleLowerCase(null)
        ];
    } catch (e) {
        return [
            "HELLO".toLocaleLowerCase(),
            "TEST".toLocaleLowerCase()
        ];
    }
}

export function test1017() {
    return [
        "HELLO".toLocaleLowerCase(123),
        "TEST".toLocaleLowerCase({}),
        "WORLD".toLocaleLowerCase(true)
    ];
}

export function test1023() {
    const longStr = "A".repeat(10000);
    const result = longStr.toLocaleLowerCase();
    return [
        result.length,
        result === ("a".repeat(10000))
    ];
}

export function test1024() {
    const mixed = "ABC123!@#".repeat(1000);
    const result = mixed.toLocaleLowerCase();
    return [
        result.length,
        result.includes("abc123!@#")
    ];
}

export function test1030() {
    const str = "𝔸𝔹ℂ";
    const lower = str.toLocaleLowerCase();
    return [
        lower,
        lower.length
    ];
}

export function test1034() {
    return [
        "ΑΛΑ".toLocaleLowerCase(),
        "ΒΗΤΑ".toLocaleLowerCase(),
        "ΓΑΜΜΑ".toLocaleLowerCase()
    ];
}

export function test1051() {
    const result = "HELLO".toLocaleLowerCase();
    return [
        typeof result,
        result instanceof String
    ];
}

export function test1052() {
    const original = "HELLO";
    const result = original.toLocaleLowerCase();
    return [
        original,
        result,
        original === result
    ];
}

export function test1054() {
    const str = "TEST";
    const first = str.toLocaleLowerCase();
    const second = str.toLocaleLowerCase();
    const third = str.toLocaleLowerCase();
    return [
        first === second && second === third
    ];
}

export function test1055() {
    const str = "HELLO";
    const result = str.toLocaleLowerCase();
    return [
        str.length,
        result.length,
        str.length === result.length
    ];
}

export function test1056() {
    const str = "HELLO";
    const result = str.toLocaleLowerCase();
    return [
        result.length,
        result.length === str.length
    ];
}

export function test1058() {
    const obj = null;
    try {
        return [String.prototype.toLocaleLowerCase.call(obj)];
    } catch (e) {
        throw e;
    }
}

export function test1059() {
    const obj = null;
    return [
        () =>String.prototype.toLocaleLowerCase.call(obj)
    ];
}

export function test1060() {
    const obj = undefined;
    return [
        () =>String.prototype.toLocaleLowerCase.call(obj)
    ];
}

export function test1064() {
    const num = 123;
    return [
        () =>num.toLocaleLowerCase(),
    ];
}

export function test1065() {
    const bool = true;
    return [
        () =>bool.toLocaleLowerCase(),
    ];
}

export function test1066() {
    return [
        String.prototype.toLocaleLowerCase.call("HELLO"),
        String.prototype.toLocaleLowerCase.call(123)
    ];
}

export function test1067() {
    return [
        () =>String.prototype.toLocaleLowerCase.apply("WORLD", []),
        () =>String.prototype.toLocaleLowerCase.apply("TEST", ["en-US"])
    ];
}

export function test1068() {
    const str = "HELLO";
    const boundToLower = str.toLocaleLowerCase.bind(str);
    return [
        boundToLower(),
        boundToLower("tr")
    ];
}


export function test1073() {
    const nfc = "É".normalize("NFC");
    return [
        nfc.toLocaleLowerCase(),
        nfc.length
    ];
}

export function test1079() {
    const parts = "A-B-C".toLocaleLowerCase().split("-");
    return [
        "HELLO WORLD".toLocaleLowerCase().split(" "),
        parts
    ];
}

export function test1082() {
    const search = "WORLD";
    const text = "Hello World";
    const isMatch = text.toLocaleLowerCase().includes(search.toLocaleLowerCase());
    return [
        isMatch
    ];
}

export function test1087() {
    function lowerTemplate(strings, ...values) {
        return strings.reduce((result, str, i) => {
            const value = values[i] ? values[i].toLocaleLowerCase() : '';
            return result + str + value;
        }, '');
    }

    const name = "WORLD";
    const result = lowerTemplate`Hello, ${name}!`;
    return [
        result
    ];
}


















