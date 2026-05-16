'use static'

export function sleep(time: int): Promise<void> {
  return new Promise<void>((re, je) => {
    setTimeout(() => {
      re(undefined)
    }, time)
  })
}