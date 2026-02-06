import booleanTest from './Boolean.test.ets'
import DataViewTest from './DataView.test.ets'
import EmojiRegExp from './EmojiBuilintsRegExp.test.ets'
import EmojiString from './EmojiBuilintsString.test.ets'
import BigIntTest from './BigInt.test.ets'
import EscapeRegexpTest from './EscapeRegexp.test.ets'
import EscapeStringTest from './EscapeString.test.ets'
import MapTest from './Map.test.ets'
import NativeJsonTest from './NativeJSON.test.ets'
import numberTest from './Number.test.ets'
import promiseTest from './Promise.test.ets'
import RegExpTest from './RegExp.test.ets'
import SetTest from './Set.test.ets'
import StringTest from './String.test.ets'
import WeakMapTest from './WeakMap.test.ets'
import etsIntlPtsFunTest from './IntlProperties.test.ets'

export default function testsuite() {
  booleanTest()
  DataViewTest()
  EmojiRegExp()
  EmojiString()
  BigIntTest()
  etsIntlPtsFunTest()
  MapTest()
  NativeJsonTest()
  numberTest()
  promiseTest()
  EscapeRegexpTest()
  SetTest()
  StringTest()
  RegExpTest()
  EscapeStringTest()
  WeakMapTest()
}
