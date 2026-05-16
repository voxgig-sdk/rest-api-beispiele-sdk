
import { Context } from './Context'


class RestApiBeispieleError extends Error {

  isRestApiBeispieleError = true

  sdk = 'RestApiBeispiele'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  RestApiBeispieleError
}

