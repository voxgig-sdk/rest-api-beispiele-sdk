package core

type RestApiBeispieleError struct {
	IsRestApiBeispieleError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewRestApiBeispieleError(code string, msg string, ctx *Context) *RestApiBeispieleError {
	return &RestApiBeispieleError{
		IsRestApiBeispieleError: true,
		Sdk:              "RestApiBeispiele",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *RestApiBeispieleError) Error() string {
	return e.Msg
}
