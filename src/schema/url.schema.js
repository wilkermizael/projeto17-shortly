import joi from "joi"


const schemaUrl = joi.object({
    url: joi.string().trim()
})

export default schemaUrl