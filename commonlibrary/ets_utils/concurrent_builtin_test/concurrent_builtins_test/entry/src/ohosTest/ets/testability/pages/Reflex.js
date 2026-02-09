/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
let flag = 'ss';

export function main1() {
    try {
        Reflect.apply(null, {}, []);
        return flag;
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main2() {
    try {
        Reflect.apply(123, {}, []);
        return flag;
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main3() {
    try {
        Reflect.apply(undefined, {}, []);
        return undefined;
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main4() {
    try {
        Reflect.apply('', {}, []);
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}


export function main5() {
    try {
        const specialChars = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';

        function echo(text) {
            return text;
        }

        const result = Reflect.apply(echo, null, [specialChars]);
        console.log(result);
        return result;
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}


export function main6() {
    try {
        const concatChars = (...chars) => chars.join('');
        const asciiCodes = Array.from({ length: 94 }, (_, i) =>
        i < 9 ? i + 32 : i + 33
        );

        return Reflect.apply(
            concatChars,
            null,
            asciiCodes.map(code => String.fromCharCode(code))
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}


export function main7() {
    try {
        const specialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main9() {
    try {
        const specialChars = '\\b';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}


export function main8() {

    try {
        const specialChars = '\\a';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}


export function main10() {
    try {
        const specialChars = '\\f';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main11() {
    try {
        const specialChars = '\\n';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main12() {
    try {
        const specialChars = '\\r';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}


export function main13() {
    try {
        const specialChars = '\\t';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main14() {
    try {
        const specialChars = '\\v';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main15() {
    try {
        const specialChars = '\\';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}


export function main16() {
    try {
        const specialChars = '\'';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main17() {
    try {
        const specialChars = '\"';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main18() {
    try {
        const specialChars = '\?';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main19() {
    try {
        const specialChars = '\0';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [...specialChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main20() {
    try {
        const octalChars = '\\141\\142\\143';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [octalChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main21() {
    try {
        const hexChars = '\\x61\\x62\\x63';
        return Reflect.apply(
            String.prototype.concat,
            '',
            [hexChars]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main22() {
    try {
        const emoji = '👆';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {

                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }

}

export function main23() {
    try {
        const emoji = '👿';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main24() {
    try {
        const emoji = '👀';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main25() {
    try {
        const emoji = '💯';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main26() {
    try {
        const emoji = '🎅';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}


export function main27() {
    try {
        const emoji = '😼';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main28() {
    try {
        const emoji = '🔧';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main29() {
    try {
        const emoji = '💇';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main30() {
    try {
        const emoji = '🤼‍♂';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main31() {
    try {
        const emoji = '🛢';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main32() {
    try {
        const emoji = '🀄';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main33() {
    try {
        const emoji = '🏴';
        const unicode = [...emoji].map(char => {
            const codePoint = char.codePointAt(0);
            if (codePoint === undefined) {
                throw new Error('Invalid character');
            }
            if (codePoint > 0xFFFF) {
                const high = Math.floor((codePoint - 0x10000) / 0x400) + 0xD800;
                const low = ((codePoint - 0x10000) % 0x400) + 0xDC00;
                return `\\u${high.toString(16).padStart(4, '0')}\\u${low.toString(16).padStart(4, '0')}`;
            } else {
                return `\\u${codePoint.toString(16).padStart(4, '0')}`;
            }
        }).join('');
        return Reflect.apply(
            String.prototype.concat,
            '',
            [unicode]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main34() {
    try {
        const keywords = ['0', 'NaN', ''];
        const processed = keywords.map(keyword => {
            return keyword;
        });
        return Reflect.apply(
            String.prototype.concat,
            '',
            processed
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main35() {
    try {
        const size = 10000;
        const treeStart = performance.now();
        Reflect.apply(init, null, [size]);
        const treeTime = performance.now() - treeStart;

        const normalStart = performance.now();
        Reflect.apply(createNormalString, null, [size]);
        const normalTime = performance.now() - normalStart;

        return `treeString时间: Xms, 普通字符串时间: Yms`;

        function init(size) {
            let ans = '[';
            while (ans.length < size) {
                ans += '{"a":1},';
            }
            ans += '{"a":1}]';
            return ans;
        }

        function createNormalString(size) {
            let ans = '';
            while (ans.length < size) {
                ans += 'a'.repeat(9);
            }
            return ans.substring(0, size);
        }

    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

export function main36() {
    try {
        const originalStr = '{k1:value1,k2:value2}';
        const iterations = 1000;
        const results = [];
        let currentStr = originalStr;
        for (let i = 0; i < iterations; i++) {
            currentStr = currentStr.substring(0, currentStr.length - 2);
            results.push(currentStr);
            if (currentStr.length === 0) {
                break;
            }
        }

        const isValid = results.every((result, index) => {
            const expectedLength = Math.max(0, originalStr.length - 2 * (index + 1));
            const expected = originalStr.substring(0, expectedLength);
            return result === expected;
        });

        return Reflect.apply(
            String.prototype.concat,
            '',
            [
                `循环次数: ${results.length}, `,
                `值是否稳定: ${isValid}`
            ]
        );
    } catch (error) {
        flag = error.name;
        return flag;
    }
    return flag;
}

