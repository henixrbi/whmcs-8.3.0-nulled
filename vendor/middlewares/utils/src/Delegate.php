<?php

namespace Middlewares\Utils;

use Interop\Http\ServerMiddleware\DelegateInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;

class Delegate implements DelegateInterface
{
    /**
     * @var callable
     */
    private $callback;

    /**
     * @param callable $callback function (RequestInterface $request) : ResponseInterface
     */
    public function __construct(callable $callback)
    {
        $this->callback = $callback;
    }

    /**
     * @param ServerRequestInterface $request
     *
     * @return ResponseInterface
     */
    public function process(ServerRequestInterface $request)
    {
        return call_user_func($this->callback, $request);
    }
}
